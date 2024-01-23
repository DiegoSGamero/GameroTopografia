class PropertiesController < ApplicationController
  def index
    @query = params[:search]&.dig(:query)
    if @query.present?
      search_query = "%#{@query}%"
      @properties = Property.where('name ILIKE :query OR owners ILIKE :query OR registration_number ILIKE :query', query: search_query)
    else
      @properties = Property.all
    end
  end


  def show
    @user = User.find(params[:id])
    @property = Property.find(params[:id])
  end

  def new
    @property = current_user.properties.build
  end

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      redirect_to @property, notice: 'Propriedade criada com sucesso.'
    else
      render :new, status: :unprocessable_entity, alert: "Não foi possível fazer o registro dessa propriedade"
      puts @property.errors.full_messages
    end
  end

  def profile
    @user = current_user
  end

  def user
    @user = User.find(params[:id])
  end

  private

  def property_params
    params.require(:property).permit(:name, :address, :owners, :size, :limit_type, :registration_number)
  end
end
