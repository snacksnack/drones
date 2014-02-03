#!/usr/bin/env ruby

module DroneStrikes

  require 'httparty'

  def pull_strikes

    feed_url = 'http://api.dronestre.am/data'
    response = HTTParty.get(feed_url)

    current = Time.now.strftime('%m%d%Y')

    logger = Logger.new(Rails.root.join('log',"drone_pull_#{current}.log"))
    logger.formatter = Logger::Formatter.new

    db = MongoMapper.database
    collection = db.collection("drones") ||
      logger.fatal("cound not connect to drones collection")

    strikes = response['strike']
    strikes.each do |strike|
      begin 
      #collection.insert(strike)
      Strike.create(strike)
      rescue Mongo::OperationFailure => e
        if e.message =~ /^1100/
          logger.warn("#{$!}")
        else
          raise e
        end
      end
    end

  end

end