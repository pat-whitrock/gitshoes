class ReposController < ApplicationController
  protect_from_forgery except: [:show]
  skip_before_action :authenticate_user!, only: [:show]
  before_action only: :show do
    authenticate_user! unless format_js?
  end

  def index
    @repos = RepoCollection.new current_user
  end

  def new
    current_user_repos_urls = current_user.repos.map do |repo|
      repo.address
    end
    repos_return = current_user.github_repos[:repos]

    @repos = repos_return.reject { |repo|
      current_user_repos_urls.include?(repo.html_url)
    }
    @total = @repos.count
    @repo = Repo.new
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
        redirect_to @repo
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
    if request.referer == new_repo_url
      return redirect_to repos_path
    end
    @repo = Repo.find_by(:id => params[:id])
    @widget = @repo.widget
    respond_to do |format|
      format.html { render :partial => "show"}
      format.js
      format.json { render json: @repo }
    end
  end

  def update
    @repo = Repo.find(params[:id])
    if @repo.update_attributes(repo_params)
      redirect_to @repo
    else
      render :edit
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
