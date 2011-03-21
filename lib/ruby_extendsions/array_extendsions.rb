module RubyExtendsions
  module ArrayExtendsions
    def self.included(base)
      base.send :include, InstanceMethods
      base.send :extend, ClassMethods
    end
    # extend ActiveSupport::Concern

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

      #whether the array is all nil item
      # like arr = [nil,nil,nil,nil]
      # arr.is_nil_all? #=> true
      def is_nil_all?
        b = true
        self.each {|i|  b = false if !i.nil? }
        return b
      end

      #for rails
      def is_blank_all?
        b = true
        self.each {|i|  b = false if !i.blank? }
        return b
      end

      #Random return an Array item
      def random
        return self[rand(self.size)]
      end
      
      # 把数组元素全部转换为字符串。
      def stringify_items!
        self.each_with_index do |item, i|
          item.is_a?(Array) ? item.stringify_items! : self[i] = item.to_s
        end
      end
      
      def stringify_items
        Marshal.load(Marshal.dump(self)).stringify_items!
      end
      
      # 二分查找返回数组index, 只限于可排序的元素
      # def binary_search_index(e, l = 0, u = length - 1)
      #         return if  l>u
      #         m=(l+u)/2
      #         begin
      #           e.to_s < self[m].to_s ? u=m-1 : l=m+1
      #           e == self[m] ? m : binary_search_index(e,l,u)
      #         rescue
      #           nil
      #         end
      #       end
      # 
      #       def b_include? e
      #         begin
      #           temp = self.sort_by{|i| i.to_s}
      #           !temp.binary_search_index(e).nil?
      #         rescue
      #           return false
      #         end
      #       end

      #比较两个数组内容相同,不包含顺序
      def compare_content com_arr
        Set.new(self) == Set.new(com_arr)
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