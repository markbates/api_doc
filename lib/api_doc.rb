require "api_doc/version"

require "api_doc/engine"

require "api_doc/document"

module ApiDoc

  module Config

    class << self

      def view_path
        @view_path ||= File.join(Rails.root, "app", "views", "api_docs").to_s
      end

      def view_path=(path)
        @view_path = path
      end

    end

  end

  class << self

    def document(env)
      puts "document!"
      doc = ApiDoc::Document.new(env)
      doc.generate!
    end

  end

end