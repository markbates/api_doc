module ApiDoc
  class Document

    def initialize(env, options = {})
      @env = env
      # puts "@env: #{@env.inspect}"
      @request = @env.request
      # @request.env.each do |key, value|
      #   puts key
      # end
      # puts "@request.env['action_dispatch.request.parameters']: #{@request.env['action_dispatch.request.parameters'].inspect}"
      # puts "@request.env['action_dispatch.request.request_parameters']: #{@request.env['action_dispatch.request.request_parameters'].inspect}"
      # puts "@request.env['action_dispatch.request.content_type']: #{@request.env['action_dispatch.request.content_type'].inspect}"
      # puts "@request.env['action_dispatch.request.path_parameters']: #{@request.env['action_dispatch.request.path_parameters'].inspect}"
      
      @response = @env.response
      @params = @request.env['action_dispatch.request.parameters']
      @path_parameters = @request.env['action_dispatch.request.path_parameters']
      # puts File.join(@params["controller"], @params["action"])
      options.reverse_merge!(path: File.join(@params["controller"], @params["action"]))
      @options = options
      # puts "@options: #{@options.inspect}"
    end

    def request_json
      # JSON.pretty_generate(JSON.parse(@response.body))
      body = @request.env['rack.input']
      if body.present?
        body.rewind
        ret = URI.unescape(body.read)
        if ret.present?
          return ret
        else
          return "// No request body necessary."
        end
      else
        return "// No request body necessary."
      end
    end

    def request_params
      @params.except(*@path_parameters.keys, "format").to_query
    end

    def response_json
      body = @response.body.strip
      if body.present?
        return JSON.pretty_generate(JSON.parse(body))
      else
        return "// No response body returned."
      end
    end

    def response_headers
      @response.headers.map {|k, v| "'#{k}': '#{v.to_json}'"}.join("\n")
    end

    def generate!
      template = ERB.new(File.read(File.join(File.dirname(__FILE__), "templates", "page.html.erb")))
      html = template.result(binding)
      # puts html
      dir_path = File.join([ApiDoc::Config.view_path, File.dirname(@options[:path]).split("/")].flatten)
      # puts "dir_path: #{dir_path.inspect}"
      FileUtils.mkdir_p(dir_path)
      File.open(File.join(dir_path, "#{@request.method}_#{File.basename(@options[:path])}_(#{@response.status}).html.erb"), 'w') do |f|
        f.write html
      end
    end

  end
end