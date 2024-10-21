require "test_helper"

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

class StudentTest < ActiveSupport::TestCase
  # Test 1: Valid Student Creation
  test "should create a valid student" do
    student = Student.new(name: "John Doe", school_email: "johndoe@example.edu", major: "Computer Science", graduation_date: Date.parse("2025-05-15"))
    assert student.save
  end

  # Test 2: Invalid Student Creation (Missing Name)
  test "should not create a student without a name" do
    student = Student.new(school_email: "johndoe@example.edu", major: "Computer Science", graduation_date: Date.parse("2025-05-15"))
    assert_not student.save
    assert_includes student.errors.full_messages, "Name can't be blank"
  end

  # Test 3: Invalid Student Creation (Invalid Email)
  test "should not create a student with an invalid email" do
    student = Student.new(name: "John Doe", school_email: "invalid_email", major: "Computer Science", graduation_date: Date.parse("2025-05-15"))
    assert_not student.save
    assert_includes student.errors.full_messages, "School email is not a valid email"
  end

  # Test 4: Invalid Student Creation (Invalid Graduation Date)
  test "should not create a student with a past graduation date" do
    student = Student.new(name: "John Doe", school_email: "johndoe@example.edu", major: "Computer Science", graduation_date: Date.yesterday)
    assert_not student.save
    assert_includes student.errors.full_messages, "Graduation date cannot be in the past"
  end

  # Test 5: Updating Student Information
  test "should update student information" do
    student = Student.create(name: "John Doe", school_email: "johndoe@example.edu", major: "Computer Science", graduation_date: Date.parse("2025-05-15"))
    student.update(name: "Jane Smith", school_email: "janesmith@example.edu", major: "Mathematics", graduation_date: Date.parse("2026-05-15"))
    student.reload
    assert_equal "Jane Smith", student.name
    assert_equal "janesmith@example.edu", student.school_email
    assert_equal "Mathematics", student.major
    assert_equal Date.parse("2026-05-15"), student.graduation_date
  end

  # Test 6: Deleting a Student
  test "should delete a student" do
    student = Student.create(name: "John Doe", school_email: "johndoe@example.edu", major: "Computer Science", graduation_date: Date.parse("2025-05-15"))
    student.destroy
    assert_not Student.exists?(student.id)
  end

  # Test 7: Student-Course Relationship (Association)
  test "should have many courses" do
    student = Student.create(name: "John Doe", school_email: "johndoe@example.edu", major: "Computer Science", graduation_date: Date.parse("2025-05-15"))
    course1 = Course.create(name: "Math")
    course2 = Course.create(name: "Science")
    student.courses << course1
    student.courses << course2
    assert student.courses.include?(course1)
    assert student.courses.include?(course2)
  end

  # Test 8: Student-Faculty Advisor Relationship (Association)
  test "should have one faculty advisor" do
    student = Student.create(name: "John Doe", school_email: "johndoe@example.edu", major: "Computer Science", graduation_date: Date.parse("2025-05-15"))
    faculty_advisor = FacultyAdvisor.create(name: "Professor Smith")
    student.faculty_advisor = faculty_advisor
    assert_equal faculty_advisor, student.faculty_advisor
  end
end
