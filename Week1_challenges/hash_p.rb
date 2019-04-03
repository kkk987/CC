items = [{ customer: "John", item: "Soup", cost: 8.50}, {customer: "Sarah", item: "Pasta", cost: 12}, {customer: "John", item: "Coke", cost: 2.50}]


def number? (number)
  
    if number.to_i == 0
      if number == "0"
      # puts "number 0"
        return number.to_i
      else
        
        return false
      end
    else
      # puts "number #{number}"
      return number.to_i
    end
    
end

flag = 0
debt = 0
_List = []
puts "Enter a customer's name"
#get client's name
c_name = gets.chomp
loop do
    puts "Press 1 to add item, press 2 to work out total"
    _Cmd = gets.chomp

    if number?(_Cmd)
        _Cmd = _Cmd.to_i
        #add item
        if _Cmd == 1
            puts "How many items would you like to add"
            _Item_N = gets.chomp

            _Item_N.to_i.times do
                puts "what would you like to add?"
                _New_item = gets.chomp
                puts "What is the cost?"
                _Cost = gets.chomp
                items <<{customer: c_name.to_s, item: _New_item.to_s, cost: _Cost.to_i}
            end
        #work out total
        elsif _Cmd == 2
            #check if client is the items list
            items.each do |item|
                if (item[:customer] == c_name) 
                    debt += item[:cost]
                    _List<< item[:item].capitalize
                else
                    flag+= 1
                end
            end
            
            if (flag == items.length)
                puts "Invalid customer name"
            else
                puts "#{c_name.capitalize} owes $#{'%.2f'%debt}"
                puts "Here is your list:#{_List}"
                break
            end
        end
    else
        puts "Invalid command"
    end

end
 