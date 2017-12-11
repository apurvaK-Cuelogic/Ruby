require 'json'
module Validation

  #checkAccNo
  def self.checkAccNo(acc_no)
    len=Math.log10(acc_no).to_i + 1
    if len!=3
      return false
    elsif Validation.alreadyExists?(acc_no,'acc_no')==true
      return false
    end
  end #checkAccNo END


  def self.alreadyExists?(acc_no,col_name)
    file = File.read('package.json')
    data_hash = JSON.parse(file)

    flag = "false"
    data_hash.each do |sub|
      sub.each do |key,value|
        if(sub[col_name] == acc_no.to_s)
          flag = "true"
        end
      end
    end

    if(flag == "true")
      return true
    else
      return false
    end

  end #alreadyExists() End

  def self.checkBalance(user,amount)

    file = File.read('package.json')
    data_hash = JSON.parse(file)

    data_hash.each do |sub|
      sub.each do |key,value|

        if(sub["username"] == user)
          if(sub["balance"].to_i <= amount)
            puts "Condition UnSatisfy for withdraw"
            return false
          end
        end

      end
    end

    return true

  end #checkBalance() End

  #checkName
  def self.checkName(name)
    if /^[a-zA-Z]+$/.match(name)==nil
      return false
    end
  end #checkname() End

  #checkPassword
  def self.checkPassword(password,confirm_password)
    if password!=confirm_password
      return false
    end
  end #checkPassword() End


  #checkUsername
  def self.checkUsername(acc_no,col_name)
    if Validation.alreadyExists?(acc_no,col_name)==true
      return false
    end
  end #checkUsername() End


end #Module End


=begin
  def self.alreadyExists?(acc_no,col_name)
    file = File.read('package.json')
    data_hash = JSON.parse(file)

    puts data_hash
    puts "Column name is ",col_name

    flag = false

    data_hash.each do |sub|
      sub.each do |key,value|
        if(sub[col_name] == acc_no)
          puts acc_no
          flag = "true"
        end
      end
      if(flag == "true")


        def self.checkName(name)
          if /^[a-zA-Z]+$/.match(name)==nil
            return false
          end
        end
        def self.checkPassword(password,confirm_password)
          if password!=confirm_password
            return false
          end
        end
=end

=begin
  def self.checkBalance(user,amount)
    all_records = CSV.read('Customer.csv', :headers=>true)
    user_record=all_records.select{|record| record["username"]==user}
    if user_record[0][5].to_i <= amount
      return false
    end
      return true
    else
      return false
    end
  end



=begin
  def self.checkUsername(acc_no,col_name)
    if Validation.alreadyExists?(acc_no,col_name)==true
      return false
    end
  end
=end

=begin
        return true
      end
      def self.checkUserPassword(user,password)
        all_records = CSV.read('Customer.csv', :headers=>true)
        user_record=all_records.select{|record| record["password"]==password}

        return true

      end
    end
  end
          flag = "true"
        end
=end
