class Train

  # def initialize(attributes)
  #   attributes.each do |key, value|

  #    end
  #  end

  #     @name = attributes['name']
  #   @id = attributes['id']

  def delete
    DB.exec("DELETE FROM #{self.class.to_s.downcase + 's'} WHERE id = '#{@id}';")
  end

  def self.all
    list = []
    results = DB.exec("SELECT * FROM #{self.to_s.downcase + 's'};")
    results.each do |result|
      list << self.new(result)
    end
    list
  end


end

