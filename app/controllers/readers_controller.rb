class ReadersController < ApplicationController
 before_filter :authenticate
 before_filter :correct_user
  # GET /readers
  # GET /readers.json
  def index
    @readers = Reader.paginate(:page => params[:page], :per_page => 10, :order => 'id DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @readers }
    end
  end

  # GET /readers/1
  # GET /readers/1.json
  def show
    @reader = Reader.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reader }
    end
  end

  # GET /readers/new
  # GET /readers/new.json
  def new
    # redirect_to readers_path
    @reader = Reader.new
    @subzone = []
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reader }
    end
  end

  # GET /readers/1/edit
  def edit
    @reader = Reader.find(params[:id])
    @subzone = SubZone.find_all_by_zone_id(@reader.zone_id) 
  end

  # POST /readers
  # POST /readers.json
  def create
    @reader = Reader.new(params[:reader])

    respond_to do |format|
      if @reader.save
        format.html { redirect_to @reader, notice: 'Reader was successfully created.' }
        format.json { render json: @reader, status: :created, location: @reader }
      else
        format.html { render action: "new" }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /readers/1
  # PUT /readers/1.json
  def update
    @reader = Reader.find(params[:id])

    respond_to do |format|
      if @reader.update_attributes(params[:reader])
        format.html { redirect_to @reader, notice: 'Reader was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readers/1
  # DELETE /readers/1.json
  def destroy
    @reader = Reader.find(params[:id])
    @reader.destroy

    respond_to do |format|
      format.html { redirect_to readers_url }
      format.json { head :no_content }
    end
  end
  
  def subzone
    @subzone = SubZone.find_all_by_zone_id(params[:zone_id]) 
  end


 private
  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    redirect_to(root_path) unless current_user.role_id != Role.find(2).id
  end
end
