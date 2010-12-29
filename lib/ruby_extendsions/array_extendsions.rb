module RubyExtendsions
  module ArrayExtendsions
    def self.included(base)
      base.send :include, InstanceMethods
      base.send :extend, ClassMethods
    end

    module InstanceMethods
      def fill_nil(val)
        self.inject([]){|s,a| s << a.to_s}
      end
    end#InstanceMethods
    
    module ClassMethods
      #TODO
    end#ClassMethods
    
  end #HashExtendsions
end #RubyExtendsions

class Array
  include RubyExtendsions::ArrayExtendsions
end