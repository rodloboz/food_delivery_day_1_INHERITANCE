require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # login:
    # ask for username
    username = @view.ask_for(:username)
    # ask for password
    password = @view.ask_for(:password)
    # find an employee with username
    user = @employee_repository.find_by_username(username)

    if user && user.password == password
      # compare
      @view.signed_in_successfully
      return user
    else
      @view.wrong_credentials
      sign_in # recursive call
    end


    # compare employee pwd with
    # provided pwd

  end
end
