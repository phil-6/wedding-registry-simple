class ItemsController < ApplicationController
  before_action :set_item, only: %i[ edit update destroy buy_form buy ]

  # GET /items
  def index
    @items = Item.unbought
  end

  def bought_items
    @items = Item.bought
    render :index
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  def buy_form
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_url, notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity, alert: "Item was not created. Something went wrong."
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to items_url, notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def buy
    debugger
    if @item.update(buy_params.merge(bought: true))
      redirect_to items_url, notice: "Thank you so much!"
    else
      render :buy_form, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy

    redirect_to items_url, notice: "Item was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :description, :link, :value, :ref)
  end

  def buy_params
    params.require(:item).permit(:bought_by, :bought_message)
  end
end
