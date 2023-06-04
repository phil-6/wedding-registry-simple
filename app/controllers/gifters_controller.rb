class GiftersController < ApplicationController
  before_action :set_gift


  # GET /gifters/new
  def new
    @gifter = @gift.gifters.new
  end

  # POST /gifters
  def create
    if @gift.gifters.create!(gifter_params)
      redirect_to root_path, notice: "Thank you so much!"
    else
      render :new, status: :unprocessable_entity, alert: "Something went wrong."
    end
  end

  private

  def set_gift
    @gift = Gift.find(params[:gift_id])
  end

  # Only allow a list of trusted parameters through.
  def gifter_params
    params.require(:gifter).permit(:name, :email, :message, :contribution)
  end
end
