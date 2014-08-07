class Stop

  attr_accessor :station_id, :line_id, :id

  def initialize(attributes)
    @station_id = attributes['station_id']
    @line_id = attributes['line_id']
    @id = attributes['id']
  end

  def self.all
    all_stops = []
    results = DB.exec("SELECT * FROM stops;")
    results.each do |result|
      all_stops << Stop.new(result)
    end
    all_stops
  end


  def save
    @id = DB.exec("INSERT INTO stops (station_id, line_id) VALUES ('#{@station_id}', '#{@line_id}') RETURNING id;").first['id'].to_i
  end
end
