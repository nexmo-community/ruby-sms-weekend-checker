namespace :scraper do
  desc "Check Website for Any Updates"
  task :check_site_update => :environment do
    DiffStorage.check_last_record
  end
end