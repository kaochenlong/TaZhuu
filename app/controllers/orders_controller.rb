class OrdersController < ApplicationController
  before_action :authenticate!

  def create
    redirect_to root_path
  end
end
