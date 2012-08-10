namespace :api do
  
  desc "Generate API documentation from RSpec tests"
  task :doc => :environment do
    ENV["API_DOC"] = "YES"
    FileUtils.rm_rf(ApiDoc::Config.view_path)
    Rake::Task['spec:controllers'].invoke
  end

end