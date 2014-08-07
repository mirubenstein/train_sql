class Line < Train

  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def save
    @id = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;").first['id'].to_i
  end

  def update(new_name)
    DB.exec("UPDATE lines SET name = '#{new_name}' WHERE id = #{@id};")
    @name = new_name
  end

  def stations
    results = DB.exec("SELECT stations.* FROM stops JOIN lines ON (stops.line_id = lines.id) JOIN stations ON (stops.station_id = stations.id) WHERE lines.id = #{id};")
    stations_arr = []
    results.each do |result|
      stations_arr << result['name']
    end
    stations_arr
  end
end




