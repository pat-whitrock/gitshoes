class RepoDecorator < SimpleDelegator
  def readable_description
    "<p><strong>Description:</strong> #{description}</p>".html_safe if description.present?
  end

  def gh_updated_at
    github_updated_at.strftime '%b %d, %Y'
  end

  def readable_language
    "<small>// #{language}</small>".html_safe if language.present?
  end

  def organization
    full_name.split('/').first
  end

  def title
    name.titleize
  end
end
