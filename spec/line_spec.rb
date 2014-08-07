require 'spec_helper'

describe :Line do
  it 'initializes a new instance of a line with a name and id' do
    expect(@new_line).to be_a Line
  end

  it 'saves lines into our line database' do
    @new_line.save
    expect(Line.all[0].name).to eq @new_line.name
  end

  it 'updates name for line' do
    @new_line.save
    @new_line.update('Yellow')
    expect(@new_line.name).to eq 'Yellow'
  end

  it 'deletes a line name' do
    @new_line.save
    @new_line.delete
    expect(Line.all).to eq []
  end


end
