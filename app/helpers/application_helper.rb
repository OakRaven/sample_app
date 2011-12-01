module ApplicationHelper
  def title
    (@title || "Home") + " | Ruby on Rails Tutorial Sample App"
  end
end
