module ApplicationHelper
  def logo(size = "h2")
    link_to(root_path, class: "logo #{size} text-decoration-none") do
      content_tag(:h2, "🔒 SafePasswords")
    end
  end

    def account_page?
      current_page?(edit_user_registration_path)
    end
end
