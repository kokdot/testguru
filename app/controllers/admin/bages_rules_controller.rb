class Admin::BagesRulesController < ApplicationController
  before_action :set_bages_rule, except: [:index, :new, :create]
  def index
    @bages_rules = BagesRule.all
  end

  def new
    @bages_rule = BagesRule.new
  end

  def create
    @bages_rule = BagesRule.new(bages_rule_params)
    if @bages_rule.save
      redirect_to [:admin, @bages_rule], notice: t('.success')
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bages_rule.update(bages_rule_params)
      redirect_to [:admin, @bages_rule]
    else
      render :edit
    end
  end

  def destroy
    @bages_rule.destroy
    redirect_to admin_bages_rules_path
  end

  private

  def bages_rule_params
    params.require(:bages_rule).permit(:rule, :bage_id, :description)
  end

  def set_bages_rule
    @bages_rule = BagesRule.find(params[:id])
  end

end
