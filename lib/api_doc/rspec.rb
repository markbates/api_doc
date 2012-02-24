RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.after(:each, :api_doc) do |example|
    # puts "example: #{example.inspect}"
    ApiDoc.document(example)
  end
end