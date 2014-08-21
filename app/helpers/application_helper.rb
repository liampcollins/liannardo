module ApplicationHelper
  def active_menu content, link
    css_class = nil
    css_class = :active if request.env["PATH_INFO"] == link
      
    content_tag :li, class: css_class do
      link_to content, link
    end
  end
end
