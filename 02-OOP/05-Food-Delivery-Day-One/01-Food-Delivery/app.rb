require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'
require_relative 'router'

meals_csv = 'data/meals.csv'
meal_repository = MealRepository.new(meals_csv)
meals_controller = MealsController.new(meal_repository)

employees_csv = 'data/employees.csv'
employee_repository = EmployeeRepository.new(employees_csv)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, sessions_controller)
router.run
