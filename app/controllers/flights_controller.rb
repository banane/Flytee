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
      @flight = Flight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flight }
    end
  end

  # GET /flights/new
  # GET /flights/new.xml
  def new
    @flight = Flight.new
    @routes_o = Route.find(:all, :order=>"origin_code", :group=>"origin_code")
    @routes_d = Route.find(:all, :order=>"dest_code", :group=>"dest_code")

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

    respond_to do |format|
      if @flight.save
#        flash[:notice] = 'Flight was successfully created.'
        format.html { redirect_to(@flight) }
#       format.xml  { render :xml => @flight, :status => :created, :location => @flight }
 		
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flight.errors, :status => :unprocessable_entity }
      end
    end

  end

  def kayak_search
  	@flight_select = FlightSelect.new
  	@srch = Search.new
  	@flight = Flight.find(params[:id])
  	puts @flight.id.to_s + "<<<<<< the flight id"
	from_time = @flight.from_date.strftime("%H:%M").to_s
    from_date = @flight.from_date.strftime("%m/%d/%Y").to_s
    to_time =   @flight.to_date.strftime("%H:%M").to_s
	to_date = @flight.to_date.strftime("%m/%d/%Y").to_s
	
	@xml = @srch.start_kayak_search(
    	@flight.from_code, 
    	@flight.to_code,
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
