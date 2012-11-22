module ApplicationHelper
  def body_css_id
    controller_path.gsub('/', '_').camelize(:lower) + "Body"
  end

  def flash_messages
    flash.collect do |key, msg|
      content_tag :p, msg, id: key, class: "flash_message"
    end.join.html_safe
  end

  def error_messages_for(resource)
    render partial: "shared/error_messages", locals: { resource: resource }
  end

  def textilize(text)
    RedCloth.new(text).to_html.html_safe
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

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html  = ""
      html  += content_tag :h3, title if title.present?
      html  += content_tag :div, :class => "in", &block
      html.html_safe
    end
  end

  def translate_attribute(model, attribute)
    model.human_attribute_name(attribute)
  end
  alias_method :ta, :translate_attribute
end