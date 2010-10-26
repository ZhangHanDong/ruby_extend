module RubyExtend
  module HashExtendsions
    def self.included(base)
      base.send :include, InstanceMethods
      base.send :extend, ClassMethods
    end

    module InstanceMethods
      def hash_reverse
        hash_new = {}
        self.each {|key,value|
          if not hash_new.has_key?(key) then hash_new[value] = key end
        }
        return hash_new
      end
    end#InstanceMethods
    
    module ClassMethods
      #TODO
    end#ClassMethods
    
  end #HashExtendsions
end #RubyExtend

class Hash
  include RubyExtend::HashExtendsions
end