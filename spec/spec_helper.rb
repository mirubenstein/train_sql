require 'rspec'
require 'pg'
require 'pry'
require './lib/station'
require './lib/line'
require './lib/stop'
require './lib/time'

DB = PG.connect({:dbname => 'test_train'})

 RSpec.configure do |config|
  config.before(:each) do

    @new_station = Station.new({'name' => 'North'})
    @new_station_n = Station.new({'name' => 'North'})
    @new_station_e = Station.new({'name' => 'East'})
    @new_station_s = Station.new({'name' => 'South'})
    @new_station_w = Station.new({'name' => 'West'})
    @new_station_dt = Station.new({'name' => 'Downtown'})
    @new_line = Line.new({'name'=> 'Blue'})
    @new_line_b = Line.new({'name'=> 'Blue'})
    @new_line_y = Line.new({'name'=> 'Yellow'})
    @new_line_r = Line.new({'name'=> 'Red'})
    @new_stop = Stop.new({'line_id' => 1, 'station_id'=> 1})
    @new_time = Train_Time.new({'stop_id' => 1, 'train_time'=>'12:00'})
  end

  config.after(:each) do
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM stops *;")
    DB.exec("DELETE FROM times *;")
  end
end
