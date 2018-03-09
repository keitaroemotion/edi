require "minitest/autorun"
require "./lib/util.rb"
require "./test/test_helper.rb"

class UtilTest < MiniTest::Test
  def setup
    @util = Util 
  end

  def test_get_user_input
    assert_equal "moomin", @util.get_user_input(mock_val: "moomin")
    assert_equal "mooMin", @util.get_user_input(mock_val: "mooMin", downcase: false)
  end

  def test_git?
    assert @util.git?
    refute @util.git?(dir: "test/")
  end

  def test_show_files
    files = 
      [
        "./edi",
        "./test/lib/util_test.rb",
        "./test/test_helper.rb",
        "./mock/web/app/controller/moomin_controller.rb",
        "./execute_test",
        "./lib/util.rb",
      ]
    assert_equal files, @util.show_files
  end

  def test_show_git_diffs
    exp_files = [
                  "lib/util.rb",
                  "mock/web/app/controller/moomin_controller.rb",
                  "test/lib/util_test.rb",
                ]  
    assert_equal exp_files, @util.show_git_diffs(base_branch: "test_branch")
    assert_equal [],        @util.show_git_diffs
  end
end  
