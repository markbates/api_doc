if ENV["API_DOC"]
  RSpec.configure do |c|
    c.treat_symbols_as_metadata_keys_with_true_values = true
    c.after(:each, :api_doc) do |example|
      # puts "example.example.metadata: #{example.example.metadata.inspect}"
      # puts "example.example.metadata[:description_args]: #{example.example.metadata[:description_args].inspect}"
      api_doc = example.example.metadata[:api_doc]
      ApiDoc.document(example, {})
    end
    c.after(:each, "api_doc") do |example|
      api_doc = example.example.metadata["api_doc"]
      # puts "api_doc: #{api_doc.inspect}"
      if api_doc.present?
        if api_doc.is_a?(Hash)
          options = api_doc.dup
        else
          options = {}
        end
        ApiDoc.document(example, options)
      end
    end
  end
end