class RepoCollection
  include ActionView::Helpers::TextHelper
  include Enumerable

  def initialize source: source
    @repos = source.all.map do |repo|
      RepoDecorator.new repo
    end
  end

  def available
    "#{pluralize(repos.count, 'repository')} available"
  end

  def each &block
    repos.each &block
  end

  def method_missing meth, *args
    repos.send meth, *args
  end

  private

  attr_reader :repos
end
