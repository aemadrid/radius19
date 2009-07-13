require File.dirname(__FILE__) + '/test_helper'

class ARLike < Radius::DelegatingOpenStruct
  def attributes
    @hash
  end
end

class RadiusTagDefinitionsTest < Test::Unit::TestCase
  include RadiusTestHelper

  def new_tag_factory
    Radius::TagDefinitions::TagFactory.new new_context
  end  

  def test_initialize
    new_tag_factory
  end

  def test_prepare_options_w_for
    tf = new_tag_factory
    ar = ARLike.new
    ar.x, ar.y, ar.z = 1, 2, 3
    res = tf.send :prepare_options, :test, { 'for' => ar, 'other' => 1, 'more' => 'mas' }
    assert_equal res.keys.size, 5
    assert_equal res[:for], ar
    assert_equal res[:expose].size, 3
    assert res[:expose].include?(:x)
    assert res[:expose].include?(:y)
    assert res[:expose].include?(:z)
    assert_equal res[:attributes], true
    assert_equal res[:other], 1
    assert_equal res[:more], 'mas'
  end

  def test_prepare_options_wo_for
    tf = new_tag_factory
    res = tf.send :prepare_options, :test, { 'other' => 1, 'more' => 'mas' }
    assert_equal res.keys.size, 4
    assert_equal res[:expose], []
    assert_equal res[:attributes], false
    assert_equal res[:other], 1
    assert_equal res[:more], 'mas'
  end

  def test_validate_params
    tf = new_tag_factory
    assert_raise(ArgumentError) { tf.send :validate_params, :echo, {} }
    assert_raise(ArgumentError) { tf.send :validate_params, :echo, { :expose => [:x]} }
  end

  def test_expand_array_option
    tf = new_tag_factory
    assert_equal tf.send(:expand_array_option, ['a', 'b', nil, 'c']), [:a, :b, :c]
  end

  def test_last_part
    tf = new_tag_factory
    assert_equal tf.send(:last_part, 'a:b:c'), 'c'
  end
end
