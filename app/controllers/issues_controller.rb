class IssuesController < ApplicationController
  protect_from_forgery except: [:new, :show, :create]
  after_action :set_access_control_headers
  skip_before_action :authenticate_user!, only: [:create, :new]

  def new
    @custom_issue = CustomIssue.new params[:repo_id]

    render partial: 'new'
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
