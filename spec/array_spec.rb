require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RubyExtend::ArrayExtendsions" do
  before(:each) do
    @arr1 = [1, 2, 3, nil, nil, nil]
    @arr2 = [[1,2,3,nil,4],[4,5,6,nil,nil]]
  end

  it "A array data should have not fill_nil method if havn't use ruby_extend " do
    @arr1.respond_to?("fill_nil").should eql false
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
  
end
