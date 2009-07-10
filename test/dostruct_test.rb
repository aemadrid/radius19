require File.dirname(__FILE__) + '/test_helper'

class TestDOS
  attr_accessor :name
end

class RadiusDelegatingOpenStructtTest < Test::Unit::TestCase
  def new_dos(obj = nil)
    Radius::DelegatingOpenStruct.new obj
  end

  def test_initialize_wo_object
    o = new_dos nil
    assert_nil o.object
  end

  def test_initialize_w_object
    x = TestDOS.new
    o = new_dos x
    assert_equal o.object, x
  end

  def test_assign_and_read_vars
    o = new_dos
    o.age = 15
    o.height = 3.5
    assert_equal o.age, 15
    assert_equal o.height, 3.5
  end

  def test_read_object
    o = new_dos TestDOS.new
    o.object.name = 'Peter'
    assert_equal o.name, 'Peter'
    assert_equal o.object.name, 'Peter'
  end

  def test_read_and_assign_mixed
    o = new_dos TestDOS.new
    o.object.name = 'Peter'
    o.age = 15
    assert_equal o.name, 'Peter'
    assert_equal o.object.name, 'Peter'
    assert_equal o.age, 15
  end

  def test_raise_on_unknown_method
    o = new_dos TestDOS.new
    assert_raise NoMethodError do
      o.age
    end
  end
end