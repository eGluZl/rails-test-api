require "test_helper"

class UserTest < ActiveSupport::TestCase

  # 使用全部合法的参数(合法的email，合法的password_digest，合法的role)创建用户，断言：通过验证
  test 'valid: user with all valid things' do
    user = User.new(email: 'user0@demo.com', password_digest: '123456', role: 1)
    assert user.valid?
  end

  # 使用 非法的email，合法的password_digest，合法的role创建用户，断言：未通过验证
  test 'invalid: user with invalid email' do
    user = User.new(email: 'test', password_digest: '123456', role: 1)
    assert_not user.valid?
  end

  # 使用 重复的email，合法的password_digest，合法的role创建用户，断言：未通过验证
  test 'invalid: user with taken email' do
    user = User.new(email: users(:one).email, password_digest: '123456', role: 1)
    assert_not user.valid?
  end

  # 使用 非法的password_digest，合法的email，合法的role创建用户，断言：未通过验证
  test 'invalid: user with invalid password_digest' do
    user = User.new(email: 'test1@test.cn', password_digest: '', role: 1)
    assert_not user.valid?
  end

  # 使用 非法的role，合法的email，合法的password_digest创建用户，断言：未通过验证
  test 'invalid: user with invalid role' do
    user = User.new(email: 'test2@test.cn', password_digest: '123456', role: 5)
    assert_not user.valid?
  end

end
