class HighlightTypesController < ApplicationController
  before_action :set_customer
  before_action :set_highlight_type, except: [:index, :new, :create]

  def index
    @highlight_types = @customer.highlight_types
  end

  def show
  end
  
  def new
    @highlight_type = @customer.highlight_types.new
  end

  def edit
  end

  def create
    @highlight_type = @customer.highlight_types.new(highlight_params) # new items will be placed at beginning of list
    respond_to do |format|
      if @highlight_type.save
        format.html { redirect_to edit_customer_path(@customer), notice: "Highlight type was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity, notice: "Highlight type creation failed." }
        format.json { render json: @highlight_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|      
      if @highlight_type.update(highlight_params)
        format.html { redirect_to edit_customer_path(@customer), notice: "Highlight type was successfully updated." }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity, notice: "Highlight type update failed." }
        format.json { render json: @highlight_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @highlight_type.destroy
    respond_to do |format|
      format.html { redirect_to edit_customer_path(@customer), notice: "Highlight type was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
  
    def set_customer
      @customer = Customer.find(params.require(:customer_id))
    end

    def set_highlight_type
      @highlight_type = @customer.highlight_types.find(params.require(:id))
    end

    def highlight_params
      params.require(:highlight_type).permit(:name, :color, :position)
    end
  end
