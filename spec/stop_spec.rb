require 'spec_helper'

describe :Stop do
  it 'initializes a new instance of a stop with id, line_id and station_id' do
    expect(@new_stop).to be_a Stop
  end

  it 'saves stops into our stop database' do
    @new_stop.save
    expect(Stop.all[0].id.to_i).to eq @new_stop.id
  end

  it 'updates station_id for stop' do
    @new_stop.save
    @new_stop.update_station(5)
    expect(@new_stop.station_id).to eq 5
  end

  it 'updates line_id for stop' do
    @new_stop.save
    @new_stop.update_line(5)
    expect(@new_stop.line_id).to eq 5
  end

  it 'deletes a stop' do
    @new_stop.save
    @new_stop.delete
  end

  it 'shows all times at stop' do
    @new_station_w.save
    @new_line_r.save
    new_stop_rw = Stop.new({'line_id' =>@new_line_r.id.to_i, 'station_id'=>@new_station_w.id.to_i})
    new_stop_rw.save
    new_time_rw1 = Train_Time.new({'stop_id' => new_stop_rw.id.to_i, 'train_time'=>'12:00'})
    new_time_rw1.save
    new_time_rw2 = Train_Time.new({'stop_id' => new_stop_rw.id.to_i, 'train_time'=>'16:00'})
    new_time_rw2.save
    expect(new_stop_rw.show_times).to eq ["12:00:00", "16:00:00"]
  end

end
