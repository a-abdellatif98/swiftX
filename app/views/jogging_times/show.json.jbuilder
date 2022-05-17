# frozen_string_literal: true

json.partial! 'jogging_times/jogging_time', jogging_time: @jogging_time
json.partial! 'jogging_times/avrege', avg_speed: @avg_speed
