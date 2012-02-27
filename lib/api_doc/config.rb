module ApiDoc

  module Config

    class << self

      def view_path
        @view_path ||= File.join(Rails.root, "app", "views", "api_docs").to_s
      end

      def view_path=(path)
        @view_path = path
      end

      def doc_title
        @doc_title ||= "API Documentation"
      end

      def doc_title=(title)
        @doc_title = title
      end

    end

  end
  
end