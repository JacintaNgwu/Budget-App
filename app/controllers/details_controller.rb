class DetailsController < ApplicationController
    before_action :set_detail, only: [:show, :edit, :update, :destroy]

    def new
        @detail = Detail.new
        @category = Category.find(params[:category_id])
    end

    def create
       
        @detail = Detail.new(detail_params)
        
        

        respond_to do |format|
            if @detail.save
                categorization = Categorization.new(category_id: params[:category], detail_id: @detail.id)
                categorization.save
                format.html { redirect_to @detail, notice: 'Detail was successfully created.' }
                format.json { render :show, status: :created, location: @detail }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @detail.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @detail.destroy

        respond_to do |format|
            format.html { redirect_to details_url, notice: 'Detail was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    def set_detail
        @detail = Detail.find(params[:id])
    end

    def detail_params
        params.require(:detail).permit(:name, :amount, :user_id)
    end
end