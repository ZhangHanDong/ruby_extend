

describe "RubyExtend#hash_reverse" do
  before(:each) do
    @hash1 = {:a => 1, :b => 2}
  end

  it "A hash data should not be reversed if havn't use ruby_extend gem" do
    @hash1.respond_to?("hash_reverse").should eql false
  end
  
  it "A hash data should be reversed" do
    require 'ruby_extend'
    @hash1.hash_reverse.should eql({1=>:a, 2=>:b} )
  end
end
