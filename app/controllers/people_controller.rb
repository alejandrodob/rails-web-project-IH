class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :new_cast]


  def index
    @people = Person.all
  end

  def show
  end

  def edit
  end

  def new
    @person = Person.new
  end

  def create
    @person =Person.new person_params

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render action: 'show', status: :created, location: @person }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  def update
      respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_cast
    @cast = @person.casts.build
  end

  def create_cast
    @cast = @person.casts.build(cast_params)
    respond_to do |format|
      if @cast.save
        format.html { redirect_to people_path, notice: "Cast added" }
        format.json { render action: :show, status: :created, location: people_path}
      else
        format.html { render action: :new }
        format.json { render json: @cast.errors, status: :unprocessable_entity}
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:person_id] || params[:id])
  end
 
  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end

  def cast_params
    params.require(:cast).permit(:movie_id, :role)
  end

end
