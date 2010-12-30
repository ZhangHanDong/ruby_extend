module RubyExtendsions
  module ArrayExtendsions
    def self.included(base)
      base.send :include, InstanceMethods
      base.send :extend, ClassMethods
    end

    module InstanceMethods
      def fill_nil(val)
        self.inject([]) {|s, a| s << (a.nil? ? a=val : a)}
      end
      
      def fill_nil!(val)
        self.each_index { |i| self[i] ||= val }
      end
      
      #change [[1,2,3][4,5,6]] to ('1','2','3'),('4','5','6')
      #be used with mess insert mysql
      def format_mess_insert
        self.inject('') do |s,i|
          t = i.inject('(') { |x, n| x << "'#{n}'," }.chop
          s << t << '),'
        end.chop
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