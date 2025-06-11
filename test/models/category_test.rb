require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "testCategory")
  end

  test "category name is required" do
    cat = Category.new(name: "")
    assert_not cat.valid?
  end








end
