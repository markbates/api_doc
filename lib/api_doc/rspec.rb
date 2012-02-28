RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.after(:each, :api_doc) do |example|
    api_doc = example.example.metadata[:api_doc]
    if api_doc.present?
      ApiDoc.document(example)
    end
  end
  c.after(:each, "api_doc") do |example|
    api_doc = example.example.metadata["api_doc"]
    if api_doc.present?
      ApiDoc.document(example, (api_doc || {}).dup)
    end
  end
end