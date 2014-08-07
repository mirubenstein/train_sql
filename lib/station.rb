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

  # def list
  #   DB.exec("")
  # end
end


