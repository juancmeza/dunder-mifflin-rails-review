class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create    
        @employee = Employee.create(emp_params)
        if @employee.valid?
            redirect_to @employee
        else
            flash[:errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(emp_params)
        redirect_to @employee
    end

    private

    def emp_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end
end
