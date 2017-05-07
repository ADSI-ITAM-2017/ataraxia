class PropertiesController < ApplicationController
  def index
	@property = Property.all
  end

  def new
    if session[:current_user_id] == nil
      redirect_to users_login_path
    else
      @property = Property.new
      @user = User.find(session[:current_user_id]) #Conseguir el user.
    end
  end

  def create
	
	@property=Property.new( property_params)
	@property.save
	redirect_to users_dashboard_path
  end
  
  def property_params
    params[:properties].permit(:name,:address,:description,:price,:available,:lesee,:distance,:elevator,:ground_floor,:pets_allowed,:furnished,:cleaning_service,:female_roomies,:male_roomies,:gym,:smoking_is_allowed,:user_id,:image)
  end

  def destroy
  end

  def information
    if session[:current_user_id] == nil
      redirect_to users_login_path
    else
      @property=Property.find(params[:id])
      @user = User.find(session[:current_user_id]) #Conseguir el user.
    end
  	  
  end
end
