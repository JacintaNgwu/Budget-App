class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
        @group_details = Expense.joins(:categorizations, :categories)
        .where('expenses.id = categorizations.expense_id')
        .where('categories.id = categorizations.category_id')
        .where('categories.id = ?', params[:id]).order('expenses.created_at DESC')
    end

    def new
        @category = Category.new
    end

    def create
        @author = current_user
        @category = Category.new(category_params)
        @category.author = @author

        respond_to do |format|
            if @category.save
                format.html { redirect_to @category, notice: 'Category was successfully created.' }
                format.json { render :show, status: :created, location: @category }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @category.destroy
        
        respond_to do |format|
            format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name, :icon_url, :user_id)
    end
end