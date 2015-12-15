class ReposController < ApplicationController
  protect_from_forgery except: [:show]
  skip_before_action :authenticate_user!, only: [:show]
  before_action only: :show do
    authenticate_user! unless format_js?
  end

  def create
    Repo.find_or_create_with_subscription(
      user: current_user,
      params: repo_params
    )

    redirect_to repos_path
  end

  def destroy
    Subscription.find_by(
      user: current_user.id,
      repo: params[:id]
    ).destroy!

    redirect_to repos_path
  end

  def index
    @repos = RepoCollection.new source: SubscribedReposQuery.new(current_user)
  end

  def new
    @repos = RepoCollection.new source: UnsubscribedReposQuery.new(current_user)

    expires_in 30.minutes, public: true
  end

  def show
    @repo = RepoDecorator.new(Repo.find(params[:id]))

    respond_to do |format|
      format.html { render partial: 'show' }
      format.js { @widget = @repo.widget }
    end
  end

  private

  def format_js?
    request.format.js?
  end

  def repo_params
    params.require(:repo).permit(:address, :token, :name,
      :description, :language, :full_name,
      :github_created_at, :github_updated_at, :page)
  end
end
