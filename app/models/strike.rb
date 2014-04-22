class Strike
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Metastamp

  validates_presence_of :lat, :lon, :date, :bij_summary_short

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
  
  def self.chartify(data=[])
    #build and array of hashes with x,y coordinates for rickshaw
    rickshaw_arr = []
    hash = {}
    data.each.with_index do |e,i|
      hash[:x] = i
      hash[:y] = e['total_strikes']
      rickshaw_arr.push(hash)
    end
    rickshaw_arr
  end

  def self.distinct_countries
    all.distinct(:country)
  end

  def self.year_range
    years = all.distinct(:year)
    years.map! do |x|
      x.split('-')[0].to_i
    end

    range = (years[0]..years[-1]).to_a
    range.map do |r|
      r = Time.gm("#{r}-01-01T00:00:000Z").to_i
    end
  end

  def self.strikes_per_year(country)

    yearly_strikes = collection.aggregate([
      {"$match" => {country: country}},
      {"$group" => {_id: "$year", total_strikes: {"$sum" => 1}}}
    ])


    unless yearly_strikes.empty?
      yearly_strikes.sort_by! { |hash| hash['_id'] }

      all_years = year_range
      country_years = []

      rs_array = []
      
      yearly_strikes.each.with_index do |year, i|
        rs_hash = {}
        country_years.push(Time.gm(year['_id']).to_i)
        rs_hash[:x] = Time.gm(year['_id']).to_i
        rs_hash[:y] = year['total_strikes']
        rs_array.push(rs_hash)
      end

      missing_years = all_years - country_years
      missing_years.each do |epoch|
        rs_hash = {}
        rs_hash[:x] = epoch
        rs_hash[:y] = 0
        rs_array.push(rs_hash)
      end
      rs_array.sort_by! { |hash| hash[:x] }
    end
  end

  def self.all_strikes_countries
    country_strikes = collection.aggregate([
      {"$group" => {_id: "$country", total_strikes: {"$sum" => 1}}}
    ])

    chartkick_hash = {}
    country_strikes.each do |strikes|
      chartkick_hash[strikes['_id']] = strikes['total_strikes']
    end
    chartkick_hash
  end

  def self.deaths_per_year(type)
    total_deaths = []
    if type == "deaths"
      total_deaths = collection.aggregate([
        {"$match" => {deaths: {"$ne" => nil}}},
        {"$group" => {_id: "$year", count: {"$sum" => 1}}} 
      ])
    elsif type == "civilians"
      total_deaths = collection.aggregate([
        {"$match" => {civilians: {"$ne" => nil}}},
        {"$group" => {_id: "$year", count: {"$sum" => 1}}}
        ])
    end

    unless total_deaths.empty?
      total_deaths.sort_by! { |hash| hash['_id'] }
      all_years = year_range
      death_years = []
      rs_array = []


      total_deaths.each_with_index do |year, i|
        rs_hash = {}
        death_years.push(Time.gm(year['_id']).to_i)
        rs_hash[:x] = Time.gm(year['_id']).to_i
        rs_hash[:y] = year['count']
        rs_array.push(rs_hash)
      end

      missing_years = all_years - death_years
      missing_years.each do |epoch|
        rs_hash = {}
        rs_hash[:x] = epoch
        rs_hash[:y] = 0
        rs_array.push(rs_hash)
      end
      rs_array.sort_by! { |hash| hash[:x] }
    end
  end

  

  def self.column_names
    self.fields.collect { |field| field[0] }
  end

  def self.search(search)
    if (search)
      any_of({:year => /#{Regexp.escape(search)}/i}, {:country => /#{Regexp.escape(search)}/i}, {:bij_summary_short => /#{Regexp.escape(search)}/i})
    else
      scoped
    end
  end
end