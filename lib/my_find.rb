require 'pry'
# can put a binding.pry anywhere in the method and 
# run ruby my_find.rb in your terminal to pry around.

def my_find(collection)

end


############# DEFINE METHOD
def my_find(collection)
    i = 0
    while i < 100
      yield(1)
        i = i + 1
    end
  end 
############### USE METHOD
collection = (1..100).to_a # range 1 to 100
my_find(collection) {|i| i % 3 == 0 and i % 5 == 0 } 
# so my_find will take any i less than 100 from method and pass it to the i % 3 == 0 etc

# for the number 1, ruby will send 
# false (the return value of the block) back to the 
# my_find method because 1 % 3 == 0 and 1 % 5 == 0 evaluates to false.



def my_find(collection)
    i = 0
    while i < collection.length
      if yield(collection[i])
# if the block returns true, return the argument we 
# passed into yield AKA the element in the array that 
# evaluated to true using return below. This will exit the loop and 
# the element will be the return value of the method.
# If the block returns false, continue to the next element in the array
        return collection[i]
      end
      i = i + 1
    end
  end 

  # above refactored =
  def my_find(collection)
    i = 0
    while i < collection.length
      return collection[i] if yield(collection[i])
      i = i + 1
    end
  end 
  # THEN.....
collection = (1..100).to_a
my_find(collection) {|i| i % 3 == 0 and i % 5 == 0 } 
# method will return the first element in the 
# array that evaluates to true. In THIS example this would be 15.