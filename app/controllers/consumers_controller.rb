class ConsumersController < ApplicationController
 before_filter :authenticate, :only => [:index,:show]
 before_filter :correct_user, :only => [:index,:show]

  # GET /consumers
  # GET /consumers.json
  def index
    @consumers = Consumer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do
         render :pdf => "file_name"
       end
      format.json { render json: @consumers }
    end
  end

  # GET /consumers/1
  # GET /consumers/1.json
  def show
    @consumer = Consumer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consumer }
    end
  end

  # GET /consumers/new
  # GET /consumers/new.json
  def new
    # redirect_to consumers_path
    @consumer = Consumer.new
    @subzone = []
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consumer }
    end
  end

  # GET /consumers/1/edit
  def edit
    @consumer = Consumer.find(params[:id])
    @subzone = SubZone.find_all_by_zone_id(@consumer.zone_id) 
  end

  # POST /consumers
  # POST /consumers.json
  def create
    if params["device"] == "mobile" 

      reading = {}
      packet = params["Packet1"].split("%")
      reading["name"] = packet[0]
      reading["sub_zone_id"] = packet[1]
      reading["zone_id"] = packet[2]
      reading["consumer_inxex_no"] = packet[3]
      reading["meter_no"] = packet[4]
      reading["new_meter_no"] = packet[5]
      reading["current_meter_reading"] = packet[6]
      reading["meter_status"] = packet[7]
      reading["meter_status_desc"] = packet[8]
      reading["remarks"] = packet[9]
      reading["contact_no"] = packet[10]
      reading["walk_id"] = packet[11]
      reading["zone_id"] = packet[12]
      reading["mr_code"] = packet[13]
      reading["mr_name"] = packet[14]
      reading["billing_cycle"] = packet[15]
      reading["consumer_address"] = packet[16]
      reading["category"] = packet[17]
      reading["image"] = params["uploaded"]
      reading["latitude"] = params["lat"]
      reading["longitude"] = params["lng"]

      @consumer = Consumer.create(reading)
      render :status =>200 ,:json => @consumer.to_json
    else

    @consumer = Consumer.new(params[:consumer])

    respond_to do |format|
      if @consumer.save
        format.html { redirect_to @consumer, notice: 'Consumer was successfully created.' }
        format.json { render json: @consumer, status: :created, location: @consumer }
      else
        format.html { render action: "new" }
        format.json { render json: @consumer.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PUT /consumers/1
  # PUT /consumers/1.json
  def update
     @consumer = Consumer.find(params[:id])
    if params["device"] == "mobile" 
      reading = {}
      packet = params["Packet1"].split("%")
      reading["name"] = packet[0]
      reading["sub_zone_id"] = packet[1]
      reading["zone_id"] = packet[2]
      reading["consumer_inxex_no"] = packet[3]
      reading["meter_no"] = packet[4]
      reading["new_meter_no"] = packet[5]
      reading["current_meter_reading"] = packet[6]
      reading["meter_status"] = packet[7]
      reading["meter_status_desc"] = packet[8]
      reading["remarks"] = packet[9]
      reading["contact_no"] = packet[10]
      reading["walk_id"] = packet[11]
      reading["zone_id"] = packet[12]
      reading["mr_code"] = packet[13]
      reading["mr_name"] = packet[14]
      reading["billing_cycle"] = packet[15]
      reading["consumer_address"] = packet[16]
      reading["category"] = packet[17]
      reading["image"] = params["uploaded"]
      reading["latitude"] = params["lat"]
      reading["longitude"] = params["lng"]

      @consumer.update_attributes(reading)
      render :status =>200 ,:json => @consumer.to_json
    else

  

    respond_to do |format|
      if @consumer.update_attributes(params[:consumer])
        format.html { redirect_to @consumer, notice: 'Consumer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @consumer.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /consumers/1
  # DELETE /consumers/1.json
  def destroy
    @consumer = Consumer.find(params[:id])
    @consumer.destroy

    respond_to do |format|
      format.html { redirect_to consumers_url }
      format.json { head :no_content }
    end
  end

  def dtc
   @dtc = Consumer.find_all_by_sub_zone_id(params[:dtc])
   # @dtc = @dtc.as_json
  
   @dtc1 = Hash["allocated_consumers" => @dtc]

    respond_to do |format|
        format.html
        format.json { render json: @dtc1 }
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
    redirect_to(root_path) unless current_user.role_id == Role.find(1).id
  end

  
end