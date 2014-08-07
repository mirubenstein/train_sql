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

  def update_station(new_value)
    DB.exec("UPDATE stops SET station_id = '#{new_value}' WHERE id = #{@id};")
    @station_id = new_value
  end

  def update_line(new_value)
    DB.exec("UPDATE stops SET line_id = '#{new_value}' WHERE id = #{@id};")
    @line_id = new_value
  end

  def delete
    DB.exec("DELETE FROM stops WHERE id = '#{@id}';")
  end
end
