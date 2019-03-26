class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    dog = Dog.create(dog_param)
    if dog.valid?
        redirect_to dog_path(dog.id)
    else
      flash[:dog_errors] = dog.errors.full_messages
        redirect_to new_dog_path
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

   def update
    dog = Dog.find(params[:id])
    dog.update(dog_param)
    if dog.valid?
      redirect_to dog_path(dog.id)
    else
      flash[:dog_errors] = dog.errors.full_messages
        redirect_to new_dog_path
    end
  end

  private

  def dog_param
    params.require(:dog).permit(:username, :password, :name, :gender, :breed, :color, :age, :personality, :size, :location)
  end


end
