module ApplicationHelper
  def active_link(current_link)
    :active if current_page?(current_link) || params[:controller] == current_link
  end
end