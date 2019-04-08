require 'yaml'
_Balance = 0;
_User_Info = []
_Transaction = []
_line = []
#_Transaction << _Balance

#check if a given file exits
#if the file doesn't exist, create a new file
def Check_File(_Filename)
    unless FIle.exist?("#{_Filename.to_s}.yml")
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
    if _Users[-1] == nil

    else
        _Users.each do |user|
            if _Id.to_i == user[:ID] && _Pwd == user[:Password]
                _Flag = 1 #existing user with matching password
                puts "Welcome back #{user[:Name]}!!"
            elsif _Id.to_i == user[:ID]
                _Flag = 2 #exisiting user ID
            end
        end
    end
    return _Flag
end



puts "Welcome to the banking app";
Check_File("_User_Info")
loop do
    puts "Please identify yourself"
    puts "Press 1 if you are a new user, press 2 if you are an existing user"
    _User = gets.to_i.chomp
    if _User == 1
        #generate a new 7-digit customer ID
        _New_ID = 1_000_000 + Random.rand(10_000_000 - 1_000_000)
        #check if there is a duplicated ID, otherwise generate another one
        until User?(_New_ID, " ") == 0 do
            _New_ID = 1_000_000 + Random.rand(10_000_000 - 1_000_000)
        end
        puts "This is your new customer ID #{_New_ID} "
        puts "Please enter your password"
        _New_Pwd = gets.chomp
        puts "Please enter your password again"
        _New_Pwd2 = gets.chomp
        until _New_Pwd == _New_Pwd2 do
            puts "Please enter your password"
            _New_Pwd = gets.chomp
            puts "Please enter your password again"
            _New_Pwd2 = gets.chomp
        end
        puts "Please enter your first name"
        _New_Name = gets.capitalize.chomp
        _User_Info << {ID: _New_ID, Password: _New_Pwd, Name: _New_Name, Balance: 0}
    elsif _User == 2
        puts "Please enter your user ID"
        _Id = gets.downcase.chomp
        puts "Please enter your password"
        _Pwd = gets.downcase.chomp
        unless User?(_Id, _Pwd) == 1
            puts "User ID doesn't exist or password mismatch"
            puts "Please try again"
        end
    else
        puts "Invalid command, please select from following"
        puts "Press 1 if you are a new user, press 2 if you are an existing user"
    end
end


#check if transaction exists
#if it does, check the validation of the latest data
#otherwise load latest balance
if File.exist?("_Transaction.yml")
    _line = YAML.load(File.read("_Transaction.yml"))
    if _line[-1] == nil
        _Balance = 0
    else
        _Balance = _line[-1]
        _line.each do |record|
            _Transaction << record
        end
    end
else
    File.open("_Transaction.yml", 'w')
end




    loop do
        
        puts "What would you like to do? (option: balance deposit withdraw history save exit)";
        _Cmd = gets.downcase.chomp;
        if _Cmd == "balance"
            puts "Your balance is #{_Balance}";
            _Pwd = gets.chomp;

        elsif _Cmd == "deposit"
            puts "how much would you like to deposit?"
            _Deposit = gets.chomp.to_i
            _Balance += _Deposit
            _Transaction << _Balance
            puts "Your balance is #{_Balance}"
        
        elsif _Cmd == "withdraw"
            puts "how much would you like to withdraw?"
            _Withdraw = gets.chomp.to_i
            if _Withdraw <= _Balance
                _Balance -= _Withdraw.to_i
                _Transaction << _Balance
                puts "Your balance is #{_Balance}"
            else
                puts "Invalid withdraw amout!"
            end
        elsif _Cmd == "history"
            puts "This is your transaction history: #{_Transaction}"
        
        elsif
            _Cmd == "save"
            File.open("_Transaction.yml", 'w') do |file|
                file.write(_Transaction.to_yaml)
            end
            _line.clear
            _line = YAML.load(File.read("_Transaction.yml"))
            puts "This is what in _Transaction.yml: #{_line}"
        elsif
            _Cmd == "exit"
            puts "Thank you for using simple bank system. Have a nice day!"
            break
        else   
            puts "Invalid selection!"

        
        
        
        end
        #system "clear"
    end


    



