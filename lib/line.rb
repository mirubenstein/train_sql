class Line

  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    all_lines = []
    results = DB.exec("SELECT * FROM lines;")
    results.each do |result|
      all_lines << Line.new(result)
    end
    all_lines
  end

  def save
    @id = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;").first['id'].to_i
  end

  def update(new_name)
    DB.exec("UPDATE lines SET name = '#{new_name}' WHERE id = #{@id};")
    @name = new_name
  end

  def delete
    DB.exec("DELETE FROM lines WHERE id = '#{@id}';")
  end

end


