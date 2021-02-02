class UsersController < ApplicationController
  def new
    render "new"
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    user = User.new({
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
      role: "Customer",
    })

    if user.save
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
