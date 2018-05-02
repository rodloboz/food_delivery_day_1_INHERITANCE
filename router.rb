# TODO: implement the router of your app.
class Router
  def initialize(controllers = {})
    @meals_controller = controllers[:meals_controller]
    @customers_controller = controllers[:customers_controller]
    @sessions_controller = controllers[:sessions_controller]
    @running = true
  end

  def run
    puts "Welcome to the Le Wagon Bistro!"
    puts "           --           "

    while @running
      @user = @sessions_controller.sign_in
      while @user
        if @user.manager?
          display_manager_menu
          action = gets.chomp.to_i
          print `clear`
          route_manager_action(action)
        else
          display_delivery_guy_menu
          action = gets.chomp.to_i
          print `clear`
          route_delivery_guy_action(action)
        end
      end
    end
    puts "Goodbye!!"
  end

  private

  def stop
    destroy_session
    @running = false
  end

  def destroy_session
    @user = nil
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then destroy_session
    when 0 then stop
    else
      puts "Please press 1, 2, 3, or 4"
    end
  end

  def display_manager_menu
    puts "###############################"
    puts "##      LE WAGON BISTRO.     ##"
    puts "###############################"
    puts "What do you want to do?"
    puts "1 - List all meals"
    puts "2 - Add a new meal"
    puts "3 - List all customers"
    puts "4 - Add a new customer"
    puts "9 - Log out"
    puts "0 - Stop and exit the program"
  end

  def route_delivery_guy_action(action)
    case action
    when 1 then puts "listing orders.."
    when 2 then puts "marking as delivered..."
    when 9 then "log out"
    when 0 then stop
    else
      puts "Please press 1, 2"
    end
  end

  def display_delivery_guy_menu
    puts "###############################"
    puts "##      LE WAGON BISTRO.     ##"
    puts "###############################"
    puts "What do you want to do?"
    puts "1 - List my orders"
    puts "2 - Mark order as delivered"
    puts "9 - Log out"
    puts "0 - Stop and exit the program"
  end
end
