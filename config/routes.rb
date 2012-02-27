ApiDoc::Engine.routes.draw do
  match "*path", to: "documents#show", as: :api_doc_page
  root to: "documents#index", as: :api_doc_home
end