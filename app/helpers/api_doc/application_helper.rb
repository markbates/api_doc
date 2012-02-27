module ApiDoc
  module ApplicationHelper
    
    def sidebar_links
      groups = {}
      # links = ""
      Dir.glob(File.join(ApiDoc::Config.view_path, "**", "*.html.erb")) do |file|
        name = file.gsub(ApiDoc::Config.view_path, "")
        name.gsub!(".html.erb", "")
        name.gsub!(/^\//, "")
        groups[File.dirname(name)] ||= []
        groups[File.dirname(name)] << name
      #   links << "<li><a href='#{api_doc_page_path(path: name)}'>#{name}</a></li>"
      end
      html = ""
      groups.each do |group, names|
        html << "<li class='nav-header'>#{group}</li>"
        names.each do |name|
          display_name = name.gsub(group, "")
          Rails.logger.info display_name
          display_name.gsub!(/^\//, "")
          Rails.logger.info display_name
          display_name.gsub!(/(^[^\_]+)\_/, '\1 ')
          Rails.logger.info display_name
          display_name.gsub!(/\_\(/, " (")
          Rails.logger.info display_name
          html << "<li><a href='#{api_doc_page_path(path: name)}'>#{display_name}</a></li>"
        end
      end
      raw html
    end

  end
end