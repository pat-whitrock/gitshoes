class UnsubscribedReposQuery
  def initialize user
    @user = user
  end

  def all
    github_repos.inject([]) do |repos, repo|
      if subscribed_repos_urls.include? repo.html_url
        repos
      else
        repos << Repo.from_github(repo)
      end
    end
  end

  private

  attr_reader :user

  def client
    @client ||= Octokit::Client.new access_token: user.token
  end

  def github_repos
    @github_repos ||= client.repos
  end

  def subscribed_repos_urls
    @subscribed_repos_urls ||= SubscribedReposQuery.new(user).all.pluck :address
  end
end
