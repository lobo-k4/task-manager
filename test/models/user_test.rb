require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(name: "Ana", password: "123456")
    assert_not user.save, "Saved user without email"
  end

  test "should not save user with invalid email" do
    user = User.new(name: "Ana", email: "invalid-email", password: "123456")
    assert_not user.save, "Saved user with invalid email"
  end
end

