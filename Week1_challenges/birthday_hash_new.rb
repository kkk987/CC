#Birthday project using hashes by Mark Ying
#Commence date 8/4/2019
#imported gem zodiac
# #obejctive:
# 1. calcualte the days between your birthday and your classmate's birthday
# 2. puts out classmate's star sign

require 'date'
require 'zodiac'
#calculate the days between your birthday and your classmate's birthday
#if the days is negative, return negative days
def calcualte_days(m_birthday_str, s_birthday_str)
    m_birthday = Date.parse(m_birthday_str)
    s_birthday = Date.parse(s_birthday_str)
    days = (m_birthday - s_birthday).to_i
    return days if days >= 0
    return -days
end
#split a standard date structure DD/MM/YYYY into an array
def split_birthday(birthday_str)
    birthday = birthday_str.split('/')
    return birthday
end

#initalize an array to store hashes
birthdays = []
#get mate's detail
puts "What is your classmate's name?"
_mate_name = gets.chomp

puts "When is his/her birthday?"
_mate_birthday = gets.chomp

#store mate's detail in the array
birthdays<< {Name: _mate_name, Birthday: _mate_birthday}

#get self's detail
puts "What is your name?"
_Self_name = gets.chomp

puts "When is your birthday?"
_Self_birthday = gets.chomp

#store self's detail in the array
birthdays<< {Name: _Self_name, Birthday: _Self_birthday}

_mate = 0
_self = 1
puts "This is the days between your birthdays #{calcualte_days(birthdays[_mate][:Birthday], birthdays[_self][:Birthday])}"

m_birtdhay_DMY = split_birthday(birthdays[_mate][:Birthday])
puts "m_birthday_DMY: #{m_birtdhay_DMY}"
puts Date.new(m_birtdhay_DMY[2].to_i, m_birtdhay_DMY[1].to_i, m_birtdhay_DMY[0].to_i).zodiac_sign





