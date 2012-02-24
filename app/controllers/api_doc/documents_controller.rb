class ApiDoc::DocumentsController < ApplicationController
  layout false

  def index
    render text: "Yeah!"
  end

  def show
    render template: File.join("api_docs", params[:path])
  end

end

# <h1><%= @options[:path] %></h1>
# <h2>Example</h2>
# <p>URL: <%= @request.path_info %></p>
# <pre><code>
# <%= json %>
# </code></pre>