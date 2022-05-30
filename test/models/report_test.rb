# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @me = users(:steve)
    @he = users(:david)
  end

  test "userとtarget_userが同じ場合" do
    my_report = Report.create(user_id: @me.id, title: '日報1', content: '初めての日報')
    assert my_report.editable?(@me)
  end

  test "userとtarget_userが異なる場合" do
    my_report = Report.create(user_id: @me.id, title: '日報1', content: '初めての日報')
    assert_not my_report.editable?(@he)
  end

  test "created_atをDate型に変換する" do
    my_report = Report.create(user_id: @me.id, title: '日報1', content: '初めての日報', created_at: '2022-05-30 13:15:03.841221
')
    assert_equal Date, my_report.created_on.class
  end

end
