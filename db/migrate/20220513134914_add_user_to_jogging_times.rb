class AddUserToJoggingTimes < ActiveRecord::Migration[7.0]
  def change
    add_reference :jogging_times, :user, null: false, foreign_key: true
  end
end
