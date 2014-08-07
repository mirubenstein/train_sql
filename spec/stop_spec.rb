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
    @new_stop.update('South')
    expect(@new_stop.name).to eq 'South'
  end

  it 'updates line_id for stop' do
    @new_stop.save
    @new_stop.update('South')
    expect(@new_stop.name).to eq 'South'
  end

  # it 'deletes a stop name' do
  #   @new_stop.save
  #   @new_stop.delete
  #   expect(Stop.all).to eq []
  # end

  # it 'lists all lines that a stop has' do
  #   @new_stop_n.save
  #   @new_line_y.save
  #   @new_line_b.save
  #   expect(@new_stop_n.lines).to eq ["Yellow", "Blue"]
  # end

end
