class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @prototypes = Prototype.all.includes(:user)
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototypes = Prototype.create(prototype_params)
    if @prototypes.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end


  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
