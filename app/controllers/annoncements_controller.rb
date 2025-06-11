class AnnoncementsController < ApplicationController
  before_action :set_annoncement, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /annoncements or /annoncements.json
  def index
    @annoncements = Annoncement.all

    if current_user
      @annoncements = Annoncement.where(user_id: current_user.id)
    end

    if params[:category].present? && params[:name].present?
      category_id = params[:category] # Retrieve the category ID
      @annoncements = @annoncements.where(category_id: category_id) # Filter by category
      @nameCat = params[:name] # Retrieve the category name to display in the view
    else
      @nameCat = "All Categories" # Default value if no category is selected
    end
  end

  def request_price
    @annoncement = Annoncement.find(params[:id])
    # Add functionality to handle the price request (e.g., email, notification, etc.)
    flash[:notice] = "Your price request has been submitted successfully!"
    redirect_to annoncement_path(@annoncement)
  end

  def show_product
    @annoncement = Annoncement.find(params[:id]) # Fetch the specific announcement by ID
  end

  # GET /annoncements/1 or /annoncements/1.json
  def show
    @annoncement = Annoncement.find(params[:id])
  end

  # GET /annoncements/new
  def new
    @annoncement = Annoncement.new
  end

  # GET /annoncements/1/edit
  def edit
  end

  # POST /annoncements or /annoncements.json
  def create
    @annoncement = Annoncement.new(annoncement_params)
    @annoncement.user = current_user
    respond_to do |format|
      if @annoncement.save
        format.html { redirect_to annoncements_path, notice: "Annoncement was successfully created." }
        format.json { render :show, status: :created, location: @annoncement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @annoncement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annoncements/1 or /annoncements/1.json
  def update
    respond_to do |format|
      if @annoncement.update(annoncement_params)
        format.html { redirect_to @annoncement, notice: "Annoncement was successfully updated." }
        format.json { render :show, status: :ok, location: @annoncement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @annoncement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annoncements/1 or /annoncements/1.json
  def destroy
    @annoncement.destroy!

    respond_to do |format|
      format.html { redirect_to annoncements_path, status: :see_other, notice: "Annoncement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annoncement
      @annoncement = Annoncement.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
  # def annoncement_params
  #   params.expect(annoncement: [ :title, :description, :type, :price, :location, :user_id, :category_id ])
  # end






  private

  def annoncement_params
    params.require(:annoncement).permit(:title, :description, :price, :category_id, images: [])
  end
end
