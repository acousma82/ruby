def bar_chart(array)
  array.each do |value|
    yield(value)*"$"
  end
end

array = [1, 2, 3, 4, 5]

puts "Multiplication:#{bar_chart(array) { |number| 3 * number }}"
# The next line of code should print:
# $$$
# $$$$$$
# $$$$$$$$$
# $$$$$$$$$$$$
# $$$$$$$$$$$$$$$


puts "Division:#{bar_chart(array) { |number| 20.0 / number }}"
# The next line of code should print:
# $$$$$$$$$$$$$$$$$$$$
# $$$$$$$$$$
# $$$$$$
# $$$$$
# $$$$
