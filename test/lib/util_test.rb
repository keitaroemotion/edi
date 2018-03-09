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
    @util.show_files.each { |file| assert File.file?(file) }
  end

  def test_show_git_diffs
    @util.show_git_diffs(base_branch: "test_branch").each do |file|
      assert File.file?(file)
    end
    assert_equal [], @util.show_git_diffs
  end
end  
