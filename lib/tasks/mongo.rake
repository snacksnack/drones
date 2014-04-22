require Rails.root.join('lib','modules','pull_strikes.rb').to_path

namespace :db do
  #include DroneStrikes
	namespace :test do
    
    task :prepare do
      include DroneStrikes
      #do not want to populate test db
      puts "hello"
      pull_strikes
    end
  end
end