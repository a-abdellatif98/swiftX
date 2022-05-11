# frozen_string_literal: true

require 'test_helper'

class JoggingTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jogging_time = jogging_times(:one)
  end

  test 'should get index' do
    get jogging_times_url
    assert_response :success
  end

  test 'should get new' do
    get new_jogging_time_url
    assert_response :success
  end

  test 'should create jogging_time' do
    assert_difference('JoggingTime.count') do
      post jogging_times_url,
           params: { jogging_time: { date: @jogging_time.date, distanse: @jogging_time.distanse,
                                     time: @jogging_time.time } }
    end

    assert_redirected_to jogging_time_url(JoggingTime.last)
  end

  test 'should show jogging_time' do
    get jogging_time_url(@jogging_time)
    assert_response :success
  end

  test 'should get edit' do
    get edit_jogging_time_url(@jogging_time)
    assert_response :success
  end

  test 'should update jogging_time' do
    patch jogging_time_url(@jogging_time),
          params: { jogging_time: { date: @jogging_time.date, distanse: @jogging_time.distanse,
                                    time: @jogging_time.time } }
    assert_redirected_to jogging_time_url(@jogging_time)
  end

  test 'should destroy jogging_time' do
    assert_difference('JoggingTime.count', -1) do
      delete jogging_time_url(@jogging_time)
    end

    assert_redirected_to jogging_times_url
  end
end
