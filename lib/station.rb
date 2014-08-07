class Station < Train

  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def save
    @id = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;").first['id'].to_i
  end

  def update(new_name)
    DB.exec("UPDATE stations SET name = '#{new_name}' WHERE id = #{@id};")
    @name = new_name
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


