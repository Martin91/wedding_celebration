class HomeController < ApplicationController
  def index
    @blessings = Blessing.order('created_at desc')
  end
end
