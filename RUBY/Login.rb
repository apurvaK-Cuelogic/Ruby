
class Login
  attr_accessor :user
  def dispLoginPage
    puts "******** LogIn ********"
    puts "Enter username"
    @username=gets.chomp
    puts "Enter password"
    @password=gets.chomp
    puts "Type 'Login' to proceed..\n"
    msg=gets.chomp
    return msg
  end

  def checkLogin
    file = File.read('package.json')
    data_hash = JSON.parse(file)

    data_hash.each do |sub|
      sub.each do |key,value|
        if(sub["username"] == @username && sub["password"] == @password)
          @@user = @username
          return true
        end
        end
    end
    return false
  end


  def self.whoLoggedIn
    return @@user
  end
end