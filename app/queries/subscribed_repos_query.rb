class SubscribedReposQuery
  def initialize user
    @user = user
  end

  def all
    user.repos.order name: :asc
  end

  private

  attr_reader :user
end
