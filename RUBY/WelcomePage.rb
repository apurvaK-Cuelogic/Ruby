class WelcomePage
  def dispWelcomePage()
    puts "\n****Welcome to BOM*****"
    puts "1.Register \n2.Login \n3.Exit \nEnter your choice\n"
    choice=Integer(gets)
    return choice
  end
end