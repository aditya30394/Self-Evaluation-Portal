require 'test_helper'

class InstructorsIndexTest < ActionDispatch::IntegrationTest
   def setup
    @admin     = instructors(:admin)
    @non_admin = instructors(:hang)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get instructors_path
    assert_template 'instructors/index'
    assert_select 'div.pagination'
    first_page_of_instructors = Instructor.paginate(page: 1, per_page: 10)
    first_page_of_instructors.each do |instructor|
      assert_select 'a[href=?]', instructor_path(instructor), text: instructor.name
      unless instructor == @admin
        assert_select 'a[href=?]', instructor_path(instructor), text: 'delete'
      end
    end
    assert_difference 'Instructor.count', -1 do
      delete instructor_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get instructors_path
    assert_select 'a', text: 'delete', count: 0
  end
end
