class HomeController < ApplicationController
  def index
  	@dsn = Display.last
  end
end
