# frozen_string_literal: true

class JoggingTime < ApplicationRecord
    belongs_to :user


    def self.avg(user)
        distance = 0
        user.jogging_time.map { |x| distance = distance + x.distanse }
        if user.jogging_time.all.count != 0
            avg_distance = distance / user.jogging_time.all.count
        else 
            avg_distance = 0 
        end
        time = 0 
        user.jogging_time.map { |x| time = time + x.time.to_i }
        if user.jogging_time.all.count != 0
            avg_time = time / user.jogging_time.all.count
        else 
            avg_time = 0 
        end
        if user.jogging_time.all.count != 0
            avg_speed = avg_distance / avg_time
        else 
            avg_speed = 0 
        end

        return avg_distance, avg_time, avg_speed
    end
end
