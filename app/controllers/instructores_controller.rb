class InstructoresController < ApplicationController
  # GET /instructores
  # GET /instructores.json
  helper_method :sort_column, :sort_direction
  def index
   if params[:limit] == nil then
   params[:limit] = 2
  end
  @instructores = Instructor.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @instructores } 
    end 
  end

  # GET /instructores/1
  # GET /instructores/1.json
  def show
    @instructor = Instructor.find(params[:id])
  end

  # GET /instructores/new
  # GET /instructores/new.json
  def new
    @instructor = Instructor.new
  end

  # GET /instructores/1/edit
  def edit
    @instructor = Instructor.find(params[:id])
  end  

  # POST /instructores
  # POST /instructores.json
  def create
   @instructor = Instructor.new(params[:instructor])
      render :action => :new unless @instructor.save
  end
    
  

  # PUT /instructores/1
  # PUT /instructores/1.json
  def update
   @instructor = Instructor.find(params[:id])
      render :action => :edit unless @instructor.update_attributes(params[:instructor])
  
  end

  # DELETE /instructores/1
  # DELETE /instructores/1.json
  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
  end

  private
  
  def sort_column
    Instructor.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
