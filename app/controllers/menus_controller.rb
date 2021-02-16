class MenusController < ApplicationController
  def index
    if @current_user.role == "Admin"
      @menus = Menu.all
      render "manage"
    else
      @menu = Menu.find_by(is_primary: true)
      render "index"
    end
  end

  def show
    ensure_admin_logged_in
    @menu = Menu.find(params[:id])
    render "show"
  end

  def update
    ensure_admin_logged_in
    menu_id = params[:id]
    name = params[:name]
    description = params[:description]
    price = params[:price]

    menu_item = MenuItem.new({
      menu_id: menu_id,
      name: name,
      description: description,
      price: price,
    })

    if menu_item.save
      redirect_to menu_path(menu_id)
    else
      flash[:error] = menu_item.errors.full_messages.join(", ")
      redirect_to menu_path(menu_id)
    end
  end

  def create
    name = params[:name]
    description = params[:description]
    menu = Menu.new({
      name: name,
      description: description,
    })

    if menu.save
      redirect_to menu_path(menu.id)
    else
      flash[:error] = menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to menus_path
  end
end
