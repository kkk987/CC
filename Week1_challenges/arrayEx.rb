four_letter_animals = ["Calf", "Duck", "Elephant", "Goat", "Lamb", "Lion", "Mule", "Dog"]

four_letter_animals << "Puma"

# puts four_letter_animals


 _Index = four_letter_animals.index("Lamb")
 four_letter_animals.insert(_Index, "Joey")

# puts four_letter_animals


 four_letter_animals.delete("Dog")

 #puts four_letter_animals

 four_letter_animals.reverse!
# puts four_letter_animals

#  _Index = four_letter_animals.index("Elephant")
#  four_letter_animals.insert(_Index, "Foal")
#  four_letter_animals.delete("Elephant")

four_letter_animals.collect! { |animal| (animal=="Elephant")? "Foal" : animal
}
puts four_letter_animals


 four_letter_animals << "Bear"
 #puts four_letter_animals

 four_letter_animals.reverse!
 puts four_letter_animals
