class Strike
  #include MongoMapper::Document
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: ObjectId
  field :number, type: String
  field :country, type: String
  field :date, type: Time
  field :town, type: String
  field :location, type: String
  field :deaths, type: Integer
  field :deaths_min, type: Integer
  field :deaths_max, type: Integer
  field :civilians, type: Integer
  field :injuries, type: Integer
  field :children, type: Integer
  field :tweet_id, type: Integer
  field :bureau_id, type: Integer
  field :bij_summary_short, type: String
  field :bij_link, type: String
  field :target, type: String
  field :lat, type: Float
  field :lon, type: Float
  field :articles, type: Array
  field :names, type: Array

end