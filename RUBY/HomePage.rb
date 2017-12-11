require_relative 'WelcomePage'
require_relative 'Login'
require_relative 'Profile'
require_relative 'Registration'
welcomePageObj=WelcomePage.new
ch=welcomePageObj.dispWelcomePage

while ch!=3
  if ch==1
    registrationObj=Registration.new
    if registrationObj.getData==true
      ch=welcomePageObj.dispWelcomePage
      next
    end
  elsif ch==2
    loginObj=Login.new
    if loginObj.dispLoginPage=="Login"
      if loginObj.checkLogin==true
        profileobj=Profile.new
        profileobj.dispOptions
      else
        puts "Incorrect username or password"
      end
    else
      ch=welcomePageObj.dispWelcomePage
      next
    end
  end
end