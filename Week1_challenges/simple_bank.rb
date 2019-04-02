
_Balance = 0;
puts "Welcome to the banking app";

    while 1
        
        puts "What would you like to do? (option: balance deposit withdraw)";
        _Cmd = gets.chomp;
        if _Cmd == "balance"
            puts "Your balance is #{_Balance}";
            puts "Please enter password."
            _Pwd = gets.chomp;

        elsif _Cmd == "deposit"
            puts "how much would you like to deposit?"
            _Deposit = gets.chomp
            _Balance += _Deposit.to_i
            puts "Your balance is #{_Balance}"
        
        elsif _Cmd == "withdraw"
            puts "how much would you like to withdraw?"
            _Withdraw = gets.chomp
            if _Withdraw <= _Balance
                _Balance -= _Withdraw.to_i
                puts "Your balance is #{_Balance}"
            else
                puts "Invalid withdraw amout!"
            end
        else   
            puts "Invalid selection!"

        
        
        
        end
        system "clear"
    end


    



