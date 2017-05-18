class UsersController < ApplicationController
  def index
	@user = User.all
  end

  def new
	@user = User.new
  end

  def create
	@user=User.new(params[:user].permit(:name,:gender,:age,:email,:password,:phone))
	@user.save
	redirect_to users_dashboard_path
  end

  def destroy
  end

  def login
    unless session[:current_user_id] == nil
      redirect_to users_dashboard_path
    end
  end

  def loginValidate
    user = User.find_by(email: params[:user][:email])
    if user && user.password == params[:user][:password]
      session[:current_user_id] = user.id #Crea session con el ID ya validado
      redirect_to users_dashboard_path #dashboard
    else
      puts '\n\nCombinación de email y constraseña incorrecta\n\n'
    end
  end

  def dashboard
    if session[:current_user_id] == nil
      redirect_to users_login_path
    else
      @user = User.find(session[:current_user_id]) #Conseguir el user.
      @propertylessor = Property.where(user_id: session[:current_user_id])
      @propertylesee = Property.where(lesee: session[:current_user_id])
      @proposal = Proposal.where(user_id: session[:current_user_id])
    end
  end

  def dashboardLogout
    reset_session #borrar toda la sesión!!
    redirect_to "/"
  end



end
