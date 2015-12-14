class ReposController < ApplicationController
  protect_from_forgery except: [:show]
  skip_before_action :authenticate_user!, only: [:show]
  before_action only: :show do
    authenticate_user! unless format_js?
  end

  def index
    @repos = RepoCollection.new source: SubscribedReposQuery.new(current_user)
  end

  def new
    @repos = RepoCollection.new source: UnsubscribedReposQuery.new(current_user)

    expires_in 30.minutes, public: true
  end

  def create
    if Repo.has_address?(repo_params[:address])
      Repo.find_or_add_user_to_repo(repo_params[:address], current_user)
      redirect_to repos_path
    else
      @repo = Repo.new(repo_params)
      @repo.token = current_user.token
      @repo.users << current_user
      @widget = Widget.create_default
      @repo.widget = @widget
      if @repo.save
        redirect_to repos_path
      else
        @repo = Repo.new(repo_params)
        @repo.token = current_user.token
        @repo.users << current_user
        if @repo.save
          redirect_to repos_path
        else
          render :new
        end
      end
    end
  end

  def show
    @repo = RepoDecorator.new(Repo.find(params[:id]))

    respond_to do |format|
      format.html { render partial: 'show' }
      format.js { @widget = @repo.widget }
    end
  end

  def destroy
    Subscription.find_by(
      user: current_user.id,
      repo: params[:id]
    ).destroy!

    redirect_to repos_path
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
