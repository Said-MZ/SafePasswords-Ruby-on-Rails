module ApplicationHelper
  def logo(size = "h2")
    link_to(root_path, class: "logo #{size} text-decoration-none") do
      content_tag(:h2, "🔒 SafePasswords")
    end
  end
end
