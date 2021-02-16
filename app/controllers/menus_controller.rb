class MenusController < ApplicationController
  def index
    @menu = Menu.find_by(is_primary: true)
    render "index"
  end
end
