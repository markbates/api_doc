module ApiDoc
  class Document

    def initialize(env, options = {})
      @env = env
      # puts "@env: #{@env.inspect}"
      @request = @env.request
      @response = @env.response
      @params = @request.headers['action_dispatch.request.path_parameters']
      options.reverse_merge!(path: File.join(@params["controller"], @params["action"]))
      @options = options
    end

    def json
      JSON.pretty_generate(JSON.parse(@response.body))
    end

    def generate!
      template = ERB.new(File.read(File.join(File.dirname(__FILE__), "templates", "template.html.erb")))
      html = template.result(binding)
      puts html
      dir_path = File.join([ApiDoc::Config.view_path, File.dirname(@options[:path]).split("/")].flatten)
      puts "dir_path: #{dir_path.inspect}"
      FileUtils.mkdir_p(dir_path)
      File.open(File.join(dir_path, "#{File.basename(@options[:path])}.html.erb"), 'w') do |f|
        f.write html
      end
    end

  end
end