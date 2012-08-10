module ApiDoc
  class Engine < Rails::Engine
    isolate_namespace ApiDoc


    # puts "config.root: #{config.root.inspect}"
    config.i18n.default_locale = "en"
    config.i18n.load_path += Dir[config.root.join('locales', '*.{rb,yml}').to_s]
    puts "config.i18n.load_path: #{config.i18n.load_path.inspect}"

    # config.to_prepare do
    #   ApplicationController.helper(::ApplicationHelper)
    # end
  end
end