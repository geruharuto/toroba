# frozen_string_literal: true

require 'test_helper'

class ActivitysControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get activitys_show_url
    assert_response :success
  end
end
