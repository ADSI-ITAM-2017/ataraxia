class PropertiesController < ApplicationController
  def index
	@property = Property.all
  end

  def new
	@property = Property.new
  end

  def create

	@property=Property.new(params[:properties].permit(:name,:address,:description,:price,:available,:lesee,:distance,:elevator,:ground_floor,:pets_allowed,:furnished,:cleaning_service,:female_roomies,:male_roomies,:gym,:smoking_is_allowed,:user_id))
		
	@property.save
	redirect_to properties_path
  end

  def destroy
  end
end
