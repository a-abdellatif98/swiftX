require 'rails_helper'

RSpec.describe JoggingTime, type: :model do

    before(:all) do
        @jt = JoggingTime.create(date: "05-05-2022", distance: "10", time: "5")
    end

    it 'checks that a jogging_time can be created' do
        expect(@jt).to be_valid
    end

    it 'checks that a jogging_time can be read' do
        expect(JoggingTime.find_by_distance("10")).to eq(@jt)
    end

    it 'checks that a jogging_time can be updated' do
        @js.update(:distance => "20")
        expect(JoggingTime.find_by_distance("20")).to eq(@jt)
    end

    it 'checks that a jogging_time can be destroyed' do
        @jt.destroy
        expect(JoggingTime.count).to eq(0)
    end
end