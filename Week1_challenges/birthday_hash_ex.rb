#birthdays = [{name: "John", birthday: "1/1/1990" star_sign: "Capricorn"},{{name: "Tom", birthday: "1/11/1990" star_sign: "Leo"},{{name: "Sam", birthday: "1/10/1990" star_sign: "Virgo"}]
#initalise an array
birthdays = []
birthday = []
_Days = 0
_month = 0
puts "What is your classmate's name?"
_C_name = gets.chomp

puts "When is his/her birthday? (DD/MM)"
_C_birth = gets.chomp

puts "What is his/her star sign?"
_C_star = gets.chomp
#stores DD at [0][0] MM at [0][1]
birthday << _C_birth.split('/')

birthdays<< {Name: _C_name, Birthday_date: birthday[0][0], Birthday_month: birthday[0][1],  Star: _C_star}

puts "What is your name?"
_Self_name = gets.chomp

puts "When is your birthday? (DD/MM)"
_Self_birth = gets.chomp

puts "What is your star sign?"
_Self_star = gets.chomp

birthday << _Self_birth.split('/')
#stores DD at [0][0] MM at [0][1]
birthdays<< {Name: _Self_name, Birthday_date: birthday[1][0], Birthday_month: birthday[1][1] Star: _Self_star}

#30-day-month: Apr, Jun, Sep, Nov
#31-day-month: Jan, Mar, May, Jul, Aug, Oct, Dec  
#28-day-month: Feb
#checks how many days in a paticular month
def _day (month)
    month = month.to_i
    if month || 1 || 3 || 5 || 7 || 8 || 10 || 12
        return 31
    elsif month || 4 || 6 || 9 || 11
        return 30
    elsif month == 2
        return 28
    else
        puts "Invalid month"
        return -1
    end
end

def smallest_number (number_1, number_2)
 
    # Your code here
    # number?(number_1) ? (puts "Valid number 1"): (puts "Invalid number_1")
    # number?(number_2) ? (puts "Valid number 2"): (puts "Invalid number_2")
   
   
      number_1_i = number_1.to_i
      number_2_i = number_2.to_i
      if number_1_i < number_2_i
        #puts "This is smaller number_1 #{number_1}"
        return 1
      elsif number_1_i > number_2_i
        #puts "This is smaller number_2 #{number_2}"
        return -1
      else
        return 0
      end
   
    
  end

birthdays.each do |birthday|
    _Days += birthday[:Birthday_date]

end

flag = smallest_number(birthdays[0][:Birthday_month], birthdays[1][:Birthday_month])

#number 1 < number 2
if flag >= 0
    _Month = birthdays[0][:Birthday_month]
elsif flag < 0
    _Month = birthdays[1][:Birthday_month]
end

#classmate's BOD and my BOD
while _Month != birthdays[1][:Birthday_month]
    _Month += 1
    days += _day(_Month)
end
