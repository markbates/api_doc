module ApiDoc
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.dirname(__FILE__)

      desc "Copies locale files to your application and mounts the ApiDoc engine."
      
      def copy_locale
        copy_file File.join("templates", "en.yml"), "config/locales/api_doc.en.yml"
      end

      def add_api_doc_routes
        route 'mount ApiDoc::Engine => "/api_docs"'  
      end

      def copy_index
        copy_file File.join("templates", "index.html.erb"), "app/views/api_doc/documents/index.html.erb"
      end
      

    end
  end
end
