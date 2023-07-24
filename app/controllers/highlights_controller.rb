class HighlightsController < ApplicationController
  before_action :set_customer
  before_action :set_highlight, only: %i[ show edit update destroy ]

  def index
    @highlights = Highlight.all
  end

  def new
    @highlight = Highlight.new
  end

  def edit
  end

  def create
    @highlight = @customer.highlights.new(highlight_params)

    respond_to do |format|
      if @highlight.save
        format.html { redirect_to edit_customer_url(@customer), notice: "Highlight was successfully created." }
        format.json { head :ok }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @highlight.update(highlight_params)
        format.html { redirect_to edit_customer_url(@customer), notice: "Highlight was successfully updated." }
        format.json { head :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @highlight.destroy
    respond_to do |format|
      format.html { redirect_to edit_customer_url(@customer), notice: "Highlight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def set_customer
      @customer = Customer.find(params.require(:customer_id))
    end

    def set_highlight
      @highlight = @customer.highlights.find(params.require(:id))
    end

    def highlight_params
      params.require(:highlight).permit(:name, :color, :position)
    end
end
