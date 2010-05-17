module Hugh
  module Helpers
    def self.included(base)
      ::ActionView::Helpers::InstanceTag.class_eval { include InstanceTag }
      ::ActionView::Helpers::FormTagHelper.class_eval { include FormTagHelper }
      ::ActionView::Helpers::FormBuilder.class_eval { include FormBuilder }
    end
    
    module FormTagHelper
      def hue_picker(object, method, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_hue_picker_tag(html_options).tap { |t| tid = t.send :tag_id } +
          javascript_tag("#{tag_id}_hue_picker = new Hugh('#{tag_id}')")
      end
    end
    
    module InstanceTag
      def to_hue_picker_tag(html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        hidden_field_tag('', value, html_options)
      end
    end
    
    module FormBuilder
      def hue_picker(method, options = {}, html_options = {})
        @template.hue_picker(@object_name, method, options.merge(:object => @object), html_options)
      end
    end
  end
end
