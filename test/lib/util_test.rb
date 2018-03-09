require "minitest/autorun"
require "./lib/util.rb"
require "./test/test_helper.rb"

class UtilTest < MiniTest::Test
  def setup
    @util = Util 
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
end  
