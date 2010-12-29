require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RubyExtend::ArrayExtendsions" do
  before(:each) do
    @arr1 = [1, 2, 3, nil, nil, nil]
  end

  it "A array data should have not fill_nil method if havn't use ruby_extend " do
    @arr1.respond_to?("fill_nil").should eql false
  end
  
  it "A array include nil object data should be fill value" do
    require 'ruby_extendsions'
    @arr1.fill_nil!('')
    @arr1.should eql([1,2,3,'','',''])
  end
  
end
