require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repo)
    @employee_repo = employee_repo
    @view = SessionsView.new
  end

  def sign_in
    # 1. ask view for username
    username = @view.ask_for('username')
    # 2. get employee from repo by username
    employee = @employee_repo.find_by_username(username)
    #   2.1. if not found, print error, goto step 1
    if employee.nil?
      @view.display_error('user not found')
      return sign_in
    end
    # 3. ask view for password
    password = @view.ask_for('password')
    # 4. check password against employee object
    #   4.1. if incorrect, print error, goto step 1
    unless employee.valid_password?(password)
      @view.display_error('password incorrect')
      return sign_in
    end
    # 5. return the employee object
    employee
  end
end

# require_relative '../repositories/employee_repository'

# employee_repo = EmployeeRepository.new('spec/support/employees.csv')
# sessions_controller = SessionsController.new(employee_repo)

# sessions_controller.sign_in
