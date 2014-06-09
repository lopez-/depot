require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    #the selectors that start with a "#" look at id attributes, those starting with a dot match on class attributes, and selectors that 
    #contain no prefix at all match on element names
    assert_select '#columns #side a', minimum: 4 #this one looks for an element named "a" that is contained in an id named "side" that is 
    #contained within an element with a value of columns, verifying that there are a minimum of 4 such elements
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
