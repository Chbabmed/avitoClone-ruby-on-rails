class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
    #@annoncements_count = Annoncement.count
    #@sales_count = Sale.count # or whatever your sales model is
    #@top_products = Annoncement.order(sales_count: :desc).limit(5)
    #@categories = Category.limit(6) # Fetches 6 popular categories (adjust logic)

    if current_user
      @annoncements_count = Annoncement.where(user_id: current_user.id).count
      @categories = Category.limit(6) # Fetches 6 popular categories (adjust logic)
    end
  end

end
