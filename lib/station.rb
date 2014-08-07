class Station

  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    all_stations = []
    results = DB.exec("SELECT * FROM stations;")
    results.each do |result|
      all_stations << Station.new(result)
    end
    all_stations
  end

  def save
    @id = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;").first['id'].to_i

  end

  def update(new_name)
    DB.exec("UPDATE stations SET name = '#{new_name}' WHERE id = #{@id};")
    @name = new_name
  end

  def delete
    DB.exec("DELETE FROM stations WHERE id = '#{@id}';")
  end

  def lines
    results = DB.exec("SELECT lines.* FROM stops JOIN lines ON (stops.line_id = lines.id) JOIN stations ON (stops.station_id = stations.id) WHERE stations.id =#{@id};")
    lines_arr = []
    results.each do |result|
      lines_arr << result['name']
    end
    lines_arr
  end
end


