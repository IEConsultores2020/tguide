# frozen_string_literal: true

require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @track = tracks(:one)
  end

  test 'should get index' do
    get tracks_url
    assert_response :success
  end

  test 'should get new' do
    get new_track_url
    assert_response :success
  end

  test 'should create track' do
    assert_difference('Track.count') do
      post tracks_url,
           params: { track: { assigned_id: @track.assigned_id, branch_id: @track.branch_id, code: @track.code,
                              owner_id: @track.owner_id, status: @track.status } }
    end

    assert_redirected_to track_url(Track.last)
  end

  test 'should show track' do
    get track_url(@track)
    assert_response :success
  end

  test 'should get edit' do
    get edit_track_url(@track)
    assert_response :success
  end

  test 'should update track' do
    patch track_url(@track),
          params: { track: { assigned_id: @track.assigned_id, branch_id: @track.branch_id, code: @track.code,
                             owner_id: @track.owner_id, status: @track.status } }
    assert_redirected_to track_url(@track)
  end

  test 'should destroy track' do
    assert_difference('Track.count', -1) do
      delete track_url(@track)
    end

    assert_redirected_to tracks_url
  end
end
