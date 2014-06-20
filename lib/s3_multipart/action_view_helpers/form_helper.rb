module S3Multipart
  module ActionViewHelpers
    module FormHelper
      def multipart_uploader_form(options = {})
        uploader_digest = S3Multipart::Uploader.serialize(options[:uploader])
        html = file_field_tag options[:input_name], :multiple => 'multiple', :data => {:uploader => uploader_digest}
        html << '<ul class="upload-container"></ul>'.html_safe
      end
    end
  end
end

ActionView::Base.send :include, S3Multipart::ActionViewHelpers::FormHelper
