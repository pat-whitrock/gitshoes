class IssuesController < ApplicationController
  protect_from_forgery :except => [:new, :show, :create]
  after_action :set_access_control_headers
  skip_before_action :authenticate_user!, :only => [:create, :new]

  def new
    @repo = Repo.find(params[:repo_id])
    @widget = @repo.widget
    @issue = Issue.new
    respond_to do |format|
      format.js   # just renders messages/create.js.erb
      format.html { render :partial => "new" }
    end
  end

  def create
    @repo = Repo.find(params[:repo_id])
    Issue.create_github_issue(issue_params, @repo)

    respond_to do |format|
      format.html { render :partial => "create" }
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:email, :title, :body, :data_image)
  end

end
