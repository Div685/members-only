module ApplicationHelper
  def user_signed_in(post)
    if user_signed_in?
      content_tag :div do
        content_tag(:strong, post.user.name.to_s.html_safe + tag(:br), class: 'text-capitalize') +
          content_tag(:small, "@#{post.user.username}")
      end
    else
      content_tag(:strong, 'Anonymous'.html_safe + tag(:br), class: 'text-capitalize') +
        content_tag(:small, '@anonymous')
    end
  end

  def nav_links
    btn_style = 'font-weight-bold text-decoration-none'
    color = 'text-white'
    logout_method = destroy_user_session_path
    if user_signed_in?
      content_tag(:div, link_to('New Post', new_post_path, class: btn_style.to_s),
                  class: 'btn btn-light mr-3') +
        content_tag(:div, link_to(current_user.name.to_s, edit_user_registration_path, class: "#{color} #{btn_style}"),
                    class: 'text-white text-capitalize') +
        content_tag(:div, link_to('Log Out', logout_method, class: "#{color} #{btn_style}", method: :delete),
                    class: 'btn mr-2')
    else
      content_tag(:div,
                  link_to('Sign In', new_user_session_path, class: "#{color} #{btn_style}"), class: 'btn mr-2') +
        content_tag(:div, link_to('Sign Up', new_user_registration_path, class: btn_style.to_s),
                    class: 'btn btn-light mr-2')
    end
  end
end
