# frozen_string_literal: true

json.array! @jogging_times, partial: 'jogging_times/jogging_time', as: :jogging_time
