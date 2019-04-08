require 'yaml'

_User_Info = []


#check if a given file exits
#if the file doesn't exist, create a new file
def Check_File(_Filename)
    unless File.exist?("#{_Filename.to_s}.yml")
        File.open("#{_Filename.to_s}.yml", 'w')
    end
end

#check if given user id is an existing customer
#existing user with matching password return 1
#existing user ID return 2 (for new user)
#non-existing user return 0
def User?(_Id, _Pwd)
    _Flag = 0
    _Users = YAML.load(File.read("_User_Info.yml"))
    #puts "_Users: #{_Users}"
    if !(_Users)
    else

        _Users.each do |user|
            if user.has_value?(_Id.to_i) && user.has_value?(_Pwd)
                _Flag = 1 #existing user with matching password
                puts "Welcome back #{user[:Name]}!!"
            end
        end
    end
    return _Flag
end

def save_user_info (users)
    # File.open("_User_Info.yml", 'w') do |file|
    #     file.write(users.to_yaml)
    # end
    File.write('_User_Info.yml', users.to_yaml)
end



def bank_cmd(_Id, _User_Info)
    loop do
        #Locate user id in user information
        _user_index = _User_Info.index{|_user| _user[:ID] == _Id.to_i}
       # puts "_user_index: #{_user_index}"
        _User = _User_Info[_user_index]
        #puts "_User: #{_User}"
        puts "What would you like to do? (option: balance deposit withdraw history save exit)";
        _Cmd = gets.downcase.chomp;
        if _Cmd == "balance"
            puts "Your balance is #{_User[:Balance]}";

        elsif _Cmd == "deposit"
            puts "how much would you like to deposit?"
            _Deposit = gets.chomp.to_i
            _User[:Balance] += _Deposit
            _User[:Transaction] << _User[:Balance]
            puts "Your balance is #{_User[:Balance]}"
        
        elsif _Cmd == "withdraw"
            puts "how much would you like to withdraw?"
            _Withdraw = gets.chomp.to_i
            if _Withdraw <= _User[:Balance]
                _User[:Balance] -= _Withdraw.to_i
                _User[:Transaction] << _User[:Balance]
                puts "Your balance is #{_User[:Balance]}"
            else
                puts "Invalid withdraw amout!"
            end
        elsif _Cmd == "history"
            puts "This is your transaction history: #{_User[:Transaction]}"
        
        elsif
            _Cmd == "save"
            # File.open("_Transaction.yml", 'w') do |file|
            #     file.write(_Transaction.to_yaml)
            # end
            #save the changes to user information file
            _User_Info[_user_index] = _User
           # puts "_User: #{_User}"
            #puts "_User_Info: #{_User_Info}"
            File.write('_User_Info.yml', _User_Info.to_yaml)
            puts "Save complete!"
            # _line = YAML.load(File.read("_User_Info.yml"))
            # puts "This is what in _User_Info.yml: #{_line}"
        elsif
            _Cmd == "exit"
            puts "Thank you for using simple bank system. Have a nice day!"
            break
        else   
            puts "Invalid selection!"

        
        
        
        end
        #system "clear"
    end
end

puts "Welcome to the banking app";
Check_File("_User_Info")
#load previous user data
_User_Info = YAML.load(File.read("_User_Info.yml"))
unless _User_Info 
    _User_Info = []
end
# puts "_User_info: #{_User_Info}"
loop do
    puts "Please identify yourself"
    puts "Press 1 if you are a new user, press 2 if you are an existing user"
    _User_type = gets.chomp.to_i
    if _User_type == 1
        #generate a new 7-digit customer ID
        _New_ID = 1_000_000 + Random.rand(10_000_000 - 1_000_000)
        #check if there is a duplicated ID, otherwise generate another one
        until User?(_New_ID, " ") == 0 do
            _New_ID = 1_000_000 + Random.rand(10_000_000 - 1_000_000)
        end
        puts "This is your new customer ID #{_New_ID} "
        #create new password
        puts "Please enter your password"
        _New_Pwd = gets.chomp
        puts "Please enter your password again"
        _New_Pwd2 = gets.chomp
        #compare two passwords to avoid typo error
        until _New_Pwd == _New_Pwd2 do
            puts "Password mismatch, please enter again"
            puts "Please enter your password"
            _New_Pwd = gets.chomp
            puts "Please enter your password again"
            _New_Pwd2 = gets.chomp
        end
        #get client's first name
        puts "Please enter your first name"
        _New_Name = gets.capitalize.chomp
        #save user information
        _New_Balance = 0
        _New_Transaction = [0]
        _User_Info << {ID: _New_ID, Password: _New_Pwd, Name: _New_Name, Balance: _New_Balance, Transaction: _New_Transaction}
        save_user_info(_User_Info)
        bank_cmd(_New_ID.to_i, _User_Info)

        break
    elsif _User_type == 2
        puts "Please enter your user ID"
        _Id = gets.downcase.chomp
        puts "Please enter your password"
        _Pwd = gets.downcase.chomp
        #check that user entered correct user id and password
        unless User?(_Id, _Pwd) == 1
            puts "User ID doesn't exist or password mismatch"
            puts "Please try again"
        end
        bank_cmd(_Id.to_i, _User_Info)
        break
    else
        puts "Invalid command, please select from following"
    end
end

