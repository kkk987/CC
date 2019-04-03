word_list = []
5.times do
    puts "Please enter a word"
    word = gets.chomp
    word = word.delete "\s"
    word_list << word
   
    if word.nil?
        puts "nil"
        break
    else
        
        #puts "Here is word #{word}"
        if word[0].downcase == "c"
            puts "The word starts with c #{word}"
        end 
    end
end


puts "word list #{word_list}"