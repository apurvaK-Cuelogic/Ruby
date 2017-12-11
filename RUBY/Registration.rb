require 'json'
require_relative 'Validation'
class Registration
  include Validation

  def getData
    valid=false
    while(valid==false)
      puts "\nEnter your Account No (Account No must be of 3 digits) \n"
      @acc_no=Integer(gets.chomp)
      if Validation.checkAccNo(@acc_no)==false
        print "Please enter valid account number or account number already exists"
        next
      end
      valid=true
    end

    valid=false
    while(valid==false)
      puts "\nEnter your name \n"
      @name=gets.chomp
      if Validation.checkName(@name)==false
        print "Name should not contain digits or symbols "
        next
      end
      valid=true
    end
    puts "Enter your age \n"
    @age=Integer(gets.chomp)
    valid=false
    while(valid==false)
      puts "Enter your username (Username must be unique)\n"
      @username=gets.chomp
      if Validation.checkUsername(@username,'username')==true
        puts "Username already exists"
        next
      end
      valid=true
    end
    valid=false
    while(valid==false)
      puts "Enter password \n"
      @password=gets.chomp
      puts "Enter confirm password\n"
      @confirm_password=gets.chomp
      if Validation.checkPassword(@password,@confirm_password)==false
        puts "Password and confirm password do not match"
        next
      end
      valid=true
    end

    register_user(@acc_no,@name,@username,@password)

    puts "Congragulations,you are successfully registered.."
   # writeIntoFile(@acc_no.to_s,@name,@age.to_s,@username,@password,0.to_s)
    return true
  end

  def register_user(acc_no,name,username,password)

    tempHash = {
        "acc_no" => acc_no,
        "name" => name,
        "username" => username,
        "password" =>password,
        "balance" => "0"
    }

    data_from_json = JSON[File.read('package.json')]
    data_from_json = [data_from_json] if data_from_json.class != Array

    File.open("package.json","w") do |f|
      f.write(JSON.pretty_generate(data_from_json << tempHash))
    end
  end

end #Registration End

