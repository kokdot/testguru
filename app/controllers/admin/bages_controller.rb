class Admin::BagesController < ApplicationController
  before_action :set_bage, except: [:index, :new, :create]
  def index
    @bages = Bage.all
  end

  def bages_by_user
    
  end

  def new
    @bage = Bage.new
  end

  def create
    @bage = current_user.bages.new(bage_params)
    if @bage.save
      redirect_to [:admin, @bage], notice: t('.success')
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bage.update(test_params)
      redirect_to [:admin, @bage]
    else
      render :edit
    end
  end

  def destroy
    @bage.destroy
    redirect_to admin_bages_path
  end

  private

  def bage_params
    params.require(:bage).permit(:title, :url_picture)
  end

  def set_bage
    @bage = Bage.find(params[:id])
  end
end
