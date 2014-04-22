require 'spec_helper'

describe Strike do

  before do
    @strike = Strike.new(
      "_id" => "aaabbbccc",
      "number" => 1,
      "country" => "Yemen",
      "date" => "2002-11-03T00:00:00.000Z",
      "town" => "Marib",
      "location" => "Marib Province",
      "deaths" => "6",
      "deaths_min" => "6",
      "deaths_max" => "6",
      "civilians" => "0",
      "injuries" => "",
      "children" => "",
      "tweet_id" => "278544689483890700",
      "bureau_id" => "YEM001",
      "bij_summary_short" => "In the first known US targeted assassination using a drone, a CIA Predator struck a car killing six al Qaeda suspects.",
      "bij_link" => "http://www.thebureauinvestigates.com/2012/03/29/yemen-reported-us-covert-actions-since-2001/",
      "target" => "",
      "lat" => "15.47467",
      "lon" => "45.322755",
      "articles" => [],
      "names" => [
        "Qa’id Salim Sinan al-Harithi, Abu Ahmad al-Hijazi, Salih Hussain Ali al-Nunu, Awsan Ahmad al-Tarihi, Munir Ahmad Abdallah al-Sauda, Adil Nasir al-Sauda’"
      ])
  end

  subject {@strike}
  
  all_fields = [:number, :country, :date, :town,
            :deaths, :deaths_min, :deaths_max,
            :injuries, :children, :tweet_id,
            :bureau_id, :bij_summary_short, :bij_link,
            :target, :lat, :lon, :articles, :names, :year]


  validated_fields = [:lat, :lon, :date, :bij_summary_short]


  all_fields.each do |f|
    it { should have_fields (f) }
  end

  validated_fields.each do |vf|
    it { should validate_presence_of(vf) }
  end

end