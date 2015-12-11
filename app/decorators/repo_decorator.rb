class RepoDecorator < SimpleDelegator
  def description
    "<p><strong>Description:</strong> #{super}</p>" if super.present?
  end

  def language
    "<small>// #{super}</small>" if super.present?
  end
end
