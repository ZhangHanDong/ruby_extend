require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RubyExtend::ArrayExtendsions" do
  before(:each) do
    @arr1 = [1, 2, 3, nil, nil, nil]
    @arr2 = [[1,2,3,nil,4],[4,5,6,nil,nil]]
    @arr3 = [nil,nil,nil,nil]
    @arr4 = [nil,nil,1,nil,nil]
  end

  it "A array data should have not fill_nil method if havn't use ruby_extend " do
    @arr1.respond_to?("fill_nil").should eql false
    @arr2.respond_to?("format_mess_insert").should eql false
    @arr2.respond_to?("is_nil_all?").should eql false
  end
  
  it "A array include nil object data should be fill value" do
    require 'ruby_extendsions'
    @arr1.fill_nil!('')
    @arr1.should eql([1,2,3,'','',''])
  end
  
  it "format_mess_insert should be successful!" do
    require 'ruby_extendsions'
    @arr2.format_mess_insert.should eql("('1','2','3','','4'),('4','5','6','','')")
  end
  
  it "whether the Array is all nil item" do
    require 'ruby_extendsions'
    @arr3.is_nil_all?.should eql true
    @arr4.is_nil_all?.should eql false
  end
  
  it "should can random return an Array item" do
    require 'ruby_extendsions'
    arr = [1,2,3,4,5,6,7,8]
    arr.random.should be_a_kind_of(Fixnum)
  end
  
  it "binary search should be use an Array object" do
    require 'ruby_extendsions'
    arr = (0..1000000).to_a
    arr.should respond_to(:binary_search_index)
    arr.should respond_to(:b_include?)
    arr.b_include?(9999).should be_true
  end
  
  it "should be compare the elements between the two Array objects" do
    arr, brr = [1,2,3], [3,2,1]
    foo, bar = [1,2,3], [3,2,1,4]
    arr.compare_content(brr).should be_true
    foo.compare_content(bar).should be_false
    (arr == brr ).should be_false
  end
  
  it "should be change to string" do
    arr, brr = [:a, [1,2,:cddd], :d, 1], [:b, [3,4,false], :b,2]
    arr.stringify_items!
    arr.should_not be == [:a, [1,2,:cddd], :d, 1]
    arr.should be == ['a', ['1','2','cddd'], 'd', '1']
    brr.stringify_items.should be ==  ["b", ["3", "4", "false"], "b", "2"]
    brr.should be == [:b, [3,4,false], :b,2]
    
    arr2 = [1,4,6,'sf', 'fs', 8, 2]
    arr2.b_include?('sf').should be_true
    arr2.b_include?(1).should be_true
    arr2.b_include?('fs').should be_true
    arr2.b_include?('8').should be_false
    
  end
  
end
