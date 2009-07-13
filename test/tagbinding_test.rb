require File.dirname(__FILE__) + '/test_helper'

class RadiusTagBindingTest < Test::Unit::TestCase
  include RadiusTestHelper
  
  def new_tag_binding(opts = {})
    opts = {
      :cnx => new_context,
      :locals => Radius::DelegatingOpenStruct.new,
      :name => :test,
      :attrs => {},
      :blk => Proc.new { 'hello!'}
    }.update(opts)
    Radius::TagBinding.new opts[:cnx], opts[:locals], opts[:name], opts[:attrs], opts[:blk]
  end

  def test_initialize
    nc = new_context
    ls = Radius::DelegatingOpenStruct.new
    nm = :xyz
    as = { :a => 1, :b => 2 }
    bk = Proc.new { 'hello!'}
    tb = new_tag_binding :cnx => nc, :locals => ls, :name => nm, :attrs => as, :blk => bk
    assert_equal tb.context, nc
    assert_equal tb.locals, ls
    assert_equal tb.name, nm
    assert_equal tb.attributes, as
    assert_equal tb.attr, as
    assert_equal tb.block, bk
  end

  def test_expand
    tb = new_tag_binding
    assert_equal tb.expand, 'hello!'
  end

  def test_single_double
    tb1 = new_tag_binding :blk => Proc.new{ 'hello!'}
    assert_equal tb1.single?, false
    assert_equal tb1.double?, true
    tb2 = new_tag_binding :blk => nil
    assert_equal tb2.single?, true
    assert_equal tb2.double?, false
  end

  def test_globals
    tb = new_tag_binding
    assert_equal tb.globals, tb.context.globals
  end
end