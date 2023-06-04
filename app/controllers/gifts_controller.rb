class GiftsController < ApplicationController
  before_action :set_gift, only: %i[ edit update destroy buy_form buy ]

  # GET /gifts
  def index
    @gifts = Gift.unbought.order(cost: :asc)
  end

  def bought_gifts
    @gifts = Gift.joins(:gifters).distinct
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  def create
    @gift = Gift.new(gift_params)

    if @gift.save
      redirect_to root_path, notice: "Gift was successfully created."
    else
      render :new, status: :unprocessable_entity, alert: "Gift was not created. Something went wrong."
    end
  end

  # PATCH/PUT /gifts/1
  def update
    if @gift.update(gift_params)
      redirect_to root_path, notice: "Gift was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /gifts/1
  def destroy
    @gift.destroy

    redirect_to gifts_url, notice: "Gift was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gift
    @gift = Gift.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gift_params
    params.require(:gift).permit(:name, :description, :link, :image_url, :cost, :splittable, :ref)
  end
end
