##Install:

simply install the gem:

  gem install ruby_extendsions
  
usage:

# Array#stringify_items! and Array#stringify_items
<pre>
  arr, brr = [:a, [1,2,:cddd], :d, 1], [:b, [3,4,false], :b,2]
  arr.stringify_items!
  arr #=> ['a', ['1','2','cddd'], 'd', '1']
  brr.stringify_items
  brr #=> ["b", ["3", "4", "false"], "b", "2"]

</pre>

# Array#binary_search_index and Array#b_include?
# Array#compare_content
<pre>
  foo, bar = [1,2,3], [3,2,1] 
  foo.compare_content bar
  #=> true 
</pre>

more ... please read source code.