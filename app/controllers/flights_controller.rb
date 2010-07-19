require RAILS_ROOT  + '/lib/Search.rb'

class FlightsController < ApplicationController


  # GET /flights
  # GET /flights.xml
  def index
    @flights = Flight.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flights }
    end
  end

  # GET /flights/1
  # GET /flights/1.xml
  def show
  #    @flight = Flight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flight }
    end
  end

  # GET /flights/new
  # GET /flights/new.xml
  def new
    @flight = Flight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flight }
    end
      end

  # GET /flights/1/edit
  def edit
    @flight = Flight.find(params[:id])
  end

  # POST /flights
  # POST /flights.xml
  def create
    @flight = Flight.new(params[:flight])
    @srch = Search.new
    @results = Hash.new

    from_date_dt =Time.utc(params[:flight][:"from_date(1i)"].to_i,params[:flight][:"from_date(2i)"].to_i,params[:flight][:"from_date(3i)"].to_i,params[:flight][:"from_date(4i)"].to_i,params[:flight][:"from_date(5i)"].to_i)
    from_time = from_date_dt.strftime("%H:%M").to_s
    from_date = from_date_dt.strftime("%m/%d/%Y").to_s

    
    to_date_dt =Time.utc(params[:flight][:"to_date(1i)"].to_i,params[:flight][:"to_date(2i)"].to_i,params[:flight][:"to_date(3i)"].to_i, params[:flight][:"to_date(4i)"].to_i,params[:flight][:"to_date(5i)"].to_i)
	to_time =   to_date_dt.strftime("%H:%M").to_s
	to_date = to_date_dt.strftime("%m/%d/%Y").to_s
    
    
   
   @results = @srch.start_kayak_search(
    	params[:flight][:from_code], 
    	params[:flight][:to_code],
    	from_date,from_time, to_date, to_time)
    	
   
   render :action => :show_many

  end
  
  
  # PUT /flights/1
  # PUT /flights/1.xml
  def update
    @flight = Flight.find(params[:id])

    respond_to do |format|
      if @flight.update_attributes(params[:flight])
        flash[:notice] = 'Flight was successfully updated.'
        format.html { redirect_to(@flight) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.xml
  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy

    respond_to do |format|
      format.html { redirect_to(flights_url) }
      format.xml  { head :ok }
    end
  end
  
	

  
end
