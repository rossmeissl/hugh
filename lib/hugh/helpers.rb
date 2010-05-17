module Hugh
  module Helpers
    def self.included(base)
      ::ActionView::Helpers::InstanceTag.send :include, InstanceTag
      ::ActionView::Helpers::FormBuilder.send :include, FormBuilder
    end
    
    def hue_picker(object, method, options = {}, html_options = {})
      instance_tag = ::ActionView::Helpers::InstanceTag.new(object, method, self, options.delete(:object))
      instance_tag.to_hue_picker_tag(html_options) + javascript_tag(instance_tag.to_hue_picker_js(html_options))
    end
    
    module InstanceTag
      def to_hue_picker_tag(html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        hidden_field_tag('', value, html_options)
      end
      
      def to_hue_picker_js(html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        "#{tag_id}_hue_picker = new Hugh('#{tag_id}')"
      end
    end
    
    module FormBuilder
      def hue_picker(method, options = {}, html_options = {})
        @template.hue_picker(@object_name, method, options.merge(:object => @object), html_options)
      end
    end
  end
end
