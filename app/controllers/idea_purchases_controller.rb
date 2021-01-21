class IdeaPurchasesController < ApplicationController
  before_action :set_idea, only: [:index, :create]

  def index
    @idea_purchase = IdeaPurchase.new
  end

  def create
    @idea_purchase = IdeaPurchase.new(idea_purchase_params)
    if @idea_purchase.valid?
      pay_idea
      @idea_purchase.save
      redirect_to idea_path(@idea.id)
    else
      render :index
    end
  end

  private

  def idea_purchase_params
    params.permit.merge(user_id: current_user.id, idea_id: params[:idea_id], token: params[:token])
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end

  def pay_idea
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @idea.price,
      card: idea_purchase_params[:token],
      currency: 'jpy'
    )
  end
end
