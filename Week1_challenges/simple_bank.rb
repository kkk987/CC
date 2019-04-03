
_Balance = 0;
_Transaction = []
#_Transaction << _Balance
puts "Welcome to the banking app";

if File.exist?("_Transaction.txt")
   _         
end
    loop do
        
        puts "What would you like to do? (option: balance deposit withdraw history)";
        _Cmd = gets.chomp;
        if _Cmd == "balance"
            puts "Your balance is #{_Balance}";
            puts "Please enter password."
            _Pwd = gets.chomp;

        elsif _Cmd == "deposit"
            puts "how much would you like to deposit?"
            _Deposit = gets.chomp
            _Balance += _Deposit.to_i
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
        elsif _Cmd = "history"
            puts "This is the transaction history: #{_Transaction}"
        else   
            puts "Invalid selection!"

        
        
        
        end
        #system "clear"
    end


    



