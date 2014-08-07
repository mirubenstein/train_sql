require 'spec_helper'

describe :Station do
  it 'initializes a new instance of a station with a name and id' do
    expect(@new_station).to be_a Station
  end

  it 'saves stations into our station database' do
    @new_station.save
    expect(Station.all[0].name).to eq @new_station.name
  end

  it 'updates name for station' do
    @new_station.save
    @new_station.update('South')
    expect(@new_station.name).to eq 'South'
  end

  it 'deletes a station name' do
    @new_station.save
    @new_station.delete
    expect(Station.all).to eq []
  end

  # it 'lists all lines that a station has' do
  #   @new_station_n.save
  #   @new_line_y.save
  #   @new_line_b.save
  #   expect(@new_station_n.lines).to eq ["Yellow", "Blue"]
  # end

end
