require Rails.root.join('lib','modules','pull_strikes.rb').to_path

namespace :db do
  
  desc "pull dronestrke data and store in mongodb"
  include DroneStrikes
  task pull_strikes: :environment do
    pull_strikes
  end
end