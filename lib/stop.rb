class Stop <Train

  attr_accessor :station_id, :line_id, :id

  def initialize(attributes)
    @station_id = attributes['station_id']
    @line_id = attributes['line_id']
    @id = attributes['id']
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

  def show_times
    results = DB.exec("SELECT * FROM times WHERE stop_id = #{id};")
    times_arr = []
    results.each do |result|
      times_arr << result['train_time']
    end
    times_arr
  end

end
