class Train_Time

  attr_accessor :stop_id, :train_time, :id

  def initialize(attributes)
    @stop_id = attributes['stop_id']
    @train_time = attributes['train_time']
    @id = attributes['id']
  end

  def self.all
    all_times = []
    results = DB.exec("SELECT * FROM times;")
    results.each do |result|
      all_times << Train_Time.new(result)
    end
    all_times
  end

  def save
    @id = DB.exec("INSERT INTO times (stop_id, train_time) VALUES ('#{@stop_id}', '#{@train_time}') RETURNING id;").first['id'].to_i
  end

  def update_time(new_value)
    DB.exec("UPDATE times SET train_time = '#{new_value}' WHERE id = #{@id};")
    @train_time = new_value
  end

  def delete
    DB.exec("DELETE FROM times WHERE id = '#{@id}';")
  end

end
