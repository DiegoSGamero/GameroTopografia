class PropertiesController < ApplicationController

  before_action :authorize_admin, only: [:index, :show]
  before_action :authorize_user, only: [:new, :create]

  def index
    @query = params[:search]&.dig(:query)
    if @query.present?
      search_query = "%#{@query}%"
      @properties = Property.where('LOWER(name) LIKE LOWER(:query) OR LOWER(owners) LIKE LOWER(:query) OR registration_number LIKE :query', query: search_query)
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
      redirect_to root_path, notice: 'Propriedade criada com sucesso.'
    else
      render :new, status: :unprocessable_entity, alert: 'Não foi possível fazer o registro dessa propriedade'
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
    params.require(:property).permit(:name, :address, :owners, :size, :limit_type, :registration_number, :car, :ccir)
  end

  def authorize_user
    unless user_signed_in? && current_user.is_a?(User)
      redirect_to root_path, alert: "Acesso negado. Você não tem permissão para acessar esta página."
    end
  end

  def authorize_admin
    unless admin_signed_in?
      redirect_to root_path, alert: "Acesso negado. Você não tem permissão para acessar esta página."
    end
  end
end
