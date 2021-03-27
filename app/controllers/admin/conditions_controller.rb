class Admin::ConditionsController < ApplicationController
  before_action :set_condition, except: [:index, :new, :create]
  def index
    @conditions = Condition.all
  end

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      redirect_to [:admin, @condition], notice: t('.success')
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @condition.update(condition_params)
      redirect_to [:admin, @condition]
    else
      render :edit
    end
  end

  def destroy
    @condition.destroy
    redirect_to admin_conditions_path
  end

  private

  def condition_params
    params.require(:condition).permit(:title, :description)
  end

  def set_condition
    @condition = Condition.find(params[:id])
  end
end
