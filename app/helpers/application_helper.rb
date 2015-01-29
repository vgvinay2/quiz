module ApplicationHelper

  def error_messages_sorted(object, message=nil,options={})
    header = options[:header] || "#{object.errors.count} errors prevented this #{object.class.name.underscore.humanize.downcase} from being saved"
    class_name = options[:class_name] || 'errorExplanation'
    html = ""
    if not object.blank?
      unless object.errors.blank?
        html << "<div class='errorExplanation' id = 'errorExplanation'>\n"
        if message.blank?
          if object.new_record?
            html << "\t\t<h3>#{header}</h3>\n"
          else
            html << "\t\t<h3>#{header}</h3>\n"
          end
        else
          html << "<h5>#{message}</h5>"
        end
        html << "\t\t<ul>\n"
        html << "\t\t\t#{object.errors.full_messages.map {|msg| msg.lstrip }.collect{|emsg| content_tag(:li,  emsg.split('_')[1])}.join}\n"
        html << "\t\t</ul>\n"
        html << "\t</div>\n"
      end
    end
    html
  end
end
