
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

  def show
  #@property = Property.search(*@search)

 #@property=params[:properties][:ground_floor] unless params[:properties].nil?

unless params[:properties].nil?

  elevator = false
  ground_floor = false
  pets_allowed = false
  furnished = false
  cleaning_service = false
  female_roomies = false
  male_roomies = false
  gym = false
  smoking_is_allowed = false


if (params[:properties][:elevator])=="1"
  elevator = true
end


if (params[:properties][:ground_floor])=="1"
  ground_floor = true
end

if (params[:properties][:pets_allowed])=="1"
  pets_allowed = true
end

if (params[:properties][:furnished])=="1"
  furnished = true
end

if (params[:properties][:cleaning_service])=="1"
  cleaning_service = true
end

if (params[:properties][:female_roomies])=="1"
  female_roomies = true
end

if (params[:properties][:male_roomies])=="1"
  male_roomies = true
end

if (params[:properties][:gym])=="1"
  gym = true
end

if (params[:properties][:smoking_is_allowed])=="1"
  smoking_is_allowed = true
end

if(params[:properties][:very_close])=="1"

#@property = Property.where(elevator: elevator, ground_floor: ground_floor, pets_allowed: pets_allowed, furnished: furnished, cleaning_service: cleaning_service, female_roomies: female_roomies, male_roomies: male_roomies, gym: gym, smoking_is_allowed: smoking_is_allowed, distance: 50..300)

 @prop =Property.where(distance: 0..1000)
end

if(params[:properties][:near])=="1"
 # @property = Property.where(elevator: elevator, ground_floor: ground_floor, pets_allowed: pets_allowed, furnished: furnished, cleaning_service: cleaning_service, female_roomies: female_roomies, male_roomies: male_roomies, gym: gym, smoking_is_allowed: smoking_is_allowed, distance: 301..2000)

@prop =Property.where(distance: 1001..3000)

end

if(params[:properties][:far])=="1"
#  @property = Property.where(elevator: elevator, ground_floor: ground_floor, pets_allowed: pets_allowed, furnished: furnished, cleaning_service: cleaning_service, female_roomies: female_roomies, male_roomies: male_roomies, gym: gym, smoking_is_allowed: smoking_is_allowed, distance: 2001..20000)

 @prop =Property.where(distance: 3001..25000)
end




@property = Property.where(elevator: elevator, ground_floor: ground_floor, pets_allowed: pets_allowed, furnished: furnished, cleaning_service: cleaning_service, female_roomies: female_roomies, male_roomies: male_roomies, gym: gym, smoking_is_allowed: smoking_is_allowed)

if(@property.inspect == "#<ActiveRecord::Relation []>" || @prop.inspect == "#<ActiveRecord::Relation []>")
  @pro = "Lo siento  :(, no está registrada una propiedad con esas características"
else
  @pro = ""
end
 # @pro = ""

 #unless
  #@property=Property.where(elevator: params[:properties][:elevator])

   #def



  def information
    if session[:current_user_id] == nil
      redirect_to users_login_path
    else
      @property=Property.find(params[:id])
      @user = User.find(session[:current_user_id]) #Conseguir el user.
    end

      end
 end
end
end
