class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.title = params[:title]
    @person.first_name = params[:person][:first_name]
    @person.last_name = params[:person][:last_name]
    if @person.save
      redirect_to root_path, notice: "Person was updated!"
    else
      render :edit

    end
  end


  def create
    @person = Person.new(params.require(:person).permit(:first_name, :last_name, :title))
    if @person.save
      redirect_to root_path, notice: "Person was created!"
    else
      render :new
    end
  end

end