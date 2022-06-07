# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @steve = create(:user)
    @david = create(:user)
  end

  test 'userとtarget_userが同じ場合' do
    my_report = create(:report, user: @steve)
    assert my_report.editable?(@steve)
  end

  test 'userとtarget_userが異なる場合' do
    my_report = create(:report, user: @steve)
    assert_not my_report.editable?(@david)
  end

  test 'created_atをDate型に変換する' do
    my_report = create(:report, user: @steve)
    assert_equal my_report.created_at.to_date, my_report.created_on
  end
end
