class PeopleController < ApplicationController
  before_action :set_person, except: [:create, :new]
  before_action :set_movie

  def new
    @person = @movie.people.build
  end

  def create
    @person = @movie.people.build person_params

    respond_to do |format|
      if @person.save
        format.html { redirect_to @movie, notice: 'Person was successfully added.' }
        format.json { render action: 'show', status: :created, location: @person }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @movie.destroy
    
    respond_to do |format|
      format.html { redirect_to movie }
      format.json { head :no_content }
    end
  end

  def update
  end


    private
  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
 
  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end

end
