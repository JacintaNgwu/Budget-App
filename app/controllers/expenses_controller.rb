class ExpensesController < ApplicationController

    def new
        @expense = Expense.new
        @category = current_user.categories # Category.find(params[:category])
    end

    def create
        print params
        expense = Expense.new(name: params[:name], amount: params[:amount], author_id: params[:author_id])

        if expense.save
            print params
            categorization = Categorization.new(category_id: params[:category], expense_id: expense.id)
            categorization.save
            redirect_to category_path(params[:category]), notice: 'expense was successfully created.'
    
        else
            render :new, status: :unprocessable_entity         
        end

    end


end