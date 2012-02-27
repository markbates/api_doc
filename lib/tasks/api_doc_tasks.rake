namespace :api do
  
  task :doc => :environment do
    FileUtils.rm_rf(ApiDoc::Config.view_path)
    Rake::Task['spec'].invoke
  end

end