require 'spec_helper'

describe :Time do
  it 'initializes a new instance of a Time with id and time_id' do
    expect(@new_time).to be_a Train_Time
  end

  it 'saves times into our time database' do
    @new_time.save
    expect(Train_Time.all[0].id.to_i).to eq @new_time.id
  end

  it 'updates stop_id for time' do
    @new_time.save
    @new_time.update_time('12:00')
    expect(@new_time.train_time).to eq '12:00'
  end

  it 'deletes a time' do
    @new_time.save
    @new_time.delete
    expect(Train_Time.all).to eq []
  end

end
