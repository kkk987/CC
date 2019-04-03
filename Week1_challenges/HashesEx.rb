person = {name: 'John', height: '2m', weight: '70kgs'}

#append a new pair of key and value to existed hash
person.merge!(occupation: "Web developer", hobbies: "art")

# person.store("occupation", "web developer")

# person.store("hobbies", "art")

person.delete(:weight)

puts "Here is John's height #{person[:height]}"

person.each do |key, value|
    puts "key: #{key}, value: #{value}"
end