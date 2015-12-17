class CustomIssue
  attr_accessor :issue, :widget

  def initialize repo_id
    @widget = Widget.find_by repo_id: repo_id
    @issue = Issue.new
  end
end
