class RepoDecorator < SimpleDelegator
  def description
    "<p><strong>Description:</strong> #{super}</p>" if super.present?
  end

  def gh_updated_at
    github_updated_at.strftime '%b %d, %Y'
  end

  def language
    "<small>// #{super}</small>" if super.present?
  end

  def organization
    full_name.split('/').first
  end

  def title
    name.titleize
  end
end
