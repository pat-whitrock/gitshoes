class RepoCollection
  include Enumerable

  def initialize user
    @repos = user.repos.order('name ASC').map do |repo|
      RepoDecorator.new repo
    end
  end

  def each &block
    @repos.each &block
  end

  def method_missing meth, *args
    @repos.send meth, *args
  end
end
