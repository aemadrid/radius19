require File.dirname(__FILE__) + '/test_helper'

class RadiusTagBindingTest < Test::Unit::TestCase
  include RadiusTestHelper
  
  def new_tag_binding(opts = {})
    opts = {
      :cnx => new_context,
      :locals => DelegatingOpenStruct.new,
      :name => :test,
      :attrs => {},
      :blk => Proc.new
    }.udate(opts)
    Radius::TagBinding.new opts[:cnx], opts[:locals], opts[:name], opts[:attrs], opts[:blk]
  end

  def test_initialize
    nc = new_context
    ls = DelegatingOpenStruct.new
    nm = :xyz
    as = { :a => 1, :b => 2 }
    bk = Proc.new
    tb = new_tag_binding :cnx => nc, :locals => ls, :name => nm, :attrs => as, 
  end

end