# frozen_string_literal: true

class JoggingTime < ApplicationRecord
  belongs_to :user

  def self.avg(user)
    distance = 0
    user.jogging_time.map { |x| distance += x.distanse }
    avg_distance =
      if user.jogging_time.all.count != 0
        distance / user.jogging_time.all.count
      else
        0
      end
    time = 0
    user.jogging_time.map { |x| time += x.time.to_i }
    avg_time =
      user.jogging_time.all.count != 0 ? time / user.jogging_time.all.count : 0
    avg_speed = user.jogging_time.all.count != 0 ? avg_distance / avg_time : 0

    [avg_distance, avg_time, avg_speed]
  end
end
