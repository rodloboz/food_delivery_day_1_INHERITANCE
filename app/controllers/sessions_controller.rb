require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # ask_user_for_username
    username = @view.ask_for(:username)
    # ask_user_for_password
    password = @view.ask_for(:password)
    # find_employee_with_username
    user = @employee_repository.find_by_username(username)

    if user && user.password == password
      # Logged in
      @view.signed_in_successfully
      user
    else
      # wrong
      @view.wrong_credentials
      # try again
      sign_in # recursive call
    end
  end
end
