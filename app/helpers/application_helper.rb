module ApplicationHelper

  def flash_messages
    flash.collect do |key, msg|
      content_tag :p, msg, id: key, class: "flash_message"
    end.join.html_safe
  end

  def error_messages_for(resource)
    render partial: "shared/error_messages", locals: { resource: resource }
  end

  def link_to_new(model, url, html_options = {})
    link_to t("new", model: model.model_name.human), url, html_options
  end

  def link_to_edit(url, html_options = {})
    html_options.reverse_merge!(:class => "green")
    link_to t("edit"), url, html_options
  end

  def link_to_destroy(url, html_options = {})
    html_options.reverse_merge!(:confirm => 'Are you sure?', :method => :delete, :class => "red")
    link_to t("destroy"), url, html_options
  end

end