puts "loading ApiDoc::Engine.routes"
ApiDoc::Engine.routes.draw do
  match "*path", to: "documents#show"
  root to: "documents#index"
  # mount ApiDoc::Engine => "/api_doc"
end