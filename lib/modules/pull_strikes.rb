#!/usr/bin/env ruby

module DroneStrikes

  require 'httparty'

  def pull_strikes

    feed_url = 'http://api.dronestre.am/data'
    response = HTTParty.get(feed_url)

    current = Time.now.strftime('%m%d%Y')

    logger = Logger.new(Rails.root.join('log',"drone_pull_#{current}.log"))
    logger.formatter = Logger::Formatter.new

    strikes = response['strike']
    strikes.each do |strike|
      begin 

      #day, time = strike['date'].split('T')
      #strike['date'] = {d: day, t: time}
      year = strike['date'].split('-')[0]
      strike['year'] = "#{year}-01-01T00:00:000Z"
      Strike.create(strike)

      rescue Mongoid::Errors::Validations => e
        if e.message =~ /blank/
          logger.warn("#{$!}")
        else
          raise e
        end
      end
    end

  end

end