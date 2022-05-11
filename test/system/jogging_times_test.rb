require "application_system_test_case"

class JoggingTimesTest < ApplicationSystemTestCase
  setup do
    @jogging_time = jogging_times(:one)
  end

  test "visiting the index" do
    visit jogging_times_url
    assert_selector "h1", text: "Jogging times"
  end

  test "should create jogging time" do
    visit jogging_times_url
    click_on "New jogging time"

    fill_in "Date", with: @jogging_time.date
    fill_in "Distanse", with: @jogging_time.distanse
    fill_in "Time", with: @jogging_time.time
    click_on "Create Jogging time"

    assert_text "Jogging time was successfully created"
    click_on "Back"
  end

  test "should update Jogging time" do
    visit jogging_time_url(@jogging_time)
    click_on "Edit this jogging time", match: :first

    fill_in "Date", with: @jogging_time.date
    fill_in "Distanse", with: @jogging_time.distanse
    fill_in "Time", with: @jogging_time.time
    click_on "Update Jogging time"

    assert_text "Jogging time was successfully updated"
    click_on "Back"
  end

  test "should destroy Jogging time" do
    visit jogging_time_url(@jogging_time)
    click_on "Destroy this jogging time", match: :first

    assert_text "Jogging time was successfully destroyed"
  end
end
