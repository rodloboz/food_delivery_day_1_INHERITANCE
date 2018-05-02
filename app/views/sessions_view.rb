require_relative 'base_view'

class SessionsView < BaseView
  def wrong_credentials
    puts "Wrong credientials... try again!"
    puts ""
  end

  def signed_in_successfully
    puts "You are signed in!"
    puts ""
  end
end
