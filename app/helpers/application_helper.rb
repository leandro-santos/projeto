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
    link_to t("Novo", model: model.model_name.human), url, class: "button"
  end

  def link_to_edit(url, html_options = {})
    html_options.reverse_merge!(:class => "button")
    link_to t("Editar"), url, html_options
  end

  def link_to_destroy(url, html_options = {})
    html_options.reverse_merge!(:confirm => 'Are you sure?', :method => :delete, :class => "button")
    link_to t("Deletar"), url, html_options
  end

end