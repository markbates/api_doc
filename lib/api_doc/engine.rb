module ApiDoc
  class Engine < Rails::Engine
    isolate_namespace ApiDoc

    # config.to_prepare do
    #   ApplicationController.helper(::ApplicationHelper)
    # end
  end
end