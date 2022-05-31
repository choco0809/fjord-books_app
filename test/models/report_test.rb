# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @Steve = create(:user)
    @David = create(:user)
  end

  test 'userとtarget_userが同じ場合' do
    my_report = create(:report, user: @Steve)
    assert my_report.editable?(@Steve)
  end

  test 'userとtarget_userが異なる場合' do
    my_report = create(:report, user: @Steve)
    assert_not my_report.editable?(@David)
  end

  test 'created_atをDate型に変換する' do
    my_report = create(:report, user: @Steve)
    assert_equal Date, my_report.created_on.class
  end
end
