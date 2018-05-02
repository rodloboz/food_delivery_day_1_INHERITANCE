require_relative 'base_view'

class SessionsView < BaseView
  def wrong_credentials
    puts "Wrong credentials... try again!!"
    puts ""
  end

  def signed_in_successfully
    puts "Signed in...Welcome!!!"
    puts ""
  end
end
