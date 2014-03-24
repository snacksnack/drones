class Strike
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Metastamp

  validates_presence_of :lat, :lon, :date, :bij_summary_short

  #include Gmaps4rails::ActsAsGmappable
  #acts_as_gmappable

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
  field :year, type: String



  #def self.yearly_deaths(date)
  #  where(:date.gte => date.at_beginning_of_year, :date.lte => date.at_end_of_year).sum(:deaths_max)
  #end

  def self.distinct_countries
    all.distinct(:country)
  end

  def self.strikes_years
    chart_strikes = []
    data = collection.aggregate([
      {"$group" => {_id: "$year", total_strikes: {"$sum" => 1}}}
    ]).each do |x|
      hash = {}
      hash[:x] = x['_id'].split('-')[0]
      hash[:y] = x['total_strikes']
      chart_strikes.push(hash)
    end
    return chart_strikes
  end

  def self.strikes_countries
    chart_strikes = []
    collection.aggregate([
      {"$group" => {_id: "$country", total_strikes: {"$sum" => 1}}}
    ]).each do |x|
      hash = {}
      hash[:x] = x['_id']
      hash[:y] = x['total_strikes']
      chart_strikes.push(hash)
    end
    return chart_strikes
  end

  def self.column_names
    self.fields.collect { |field| field[0] }
  end


#any_of(:year => /#{Regexp.escape(search)}/i)
#elsif
#any_of({:country => /#{Regexp.escape(search)}/i}, {:bij_summary_short => /#{Regexp.escape(search)}/i})
  def self.search(search)
    if (search)
      any_of({:year => /#{Regexp.escape(search)}/i}, {:country => /#{Regexp.escape(search)}/i}, {:bij_summary_short => /#{Regexp.escape(search)}/i})
    else
      scoped
    end
  end
end