require RAILS_ROOT  + '/lib/Search.rb'

class FlightsController < ApplicationController

  def index
    @flights = Flight.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flights }
    end
  end

  def show
      @flight = Flight.find(params[:id])
      @flight_select = FlightSelect.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flight }
    end
  end

  def new
    @airports = Airports.find(:all, :order=>'City')
	session[:freeze_fee] = 1+rand(20) 
	
	puts session[:freeze_fee].to_s + '<--------- fee'

    # do the toggle    
#	version = session[:test_version]
#	version ^=1
#	session[:test_version] = version
	session[:test_version] = 'freeze fee testing'
	
	session[:source] = params[:source]	
  
    @flight = Flight.new

    respond_to do |format|
        format.html
        format.xml { render :xml => @flight }
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
   
   session[:test_version]? version= 'multiple choice' : version='single choice'
   @survey = SurveyUser.new(:source=>session[:source], :test_version=>version)
	@survey.save

    respond_to do |format|
      if @flight.save

		if session[:test_version] then @flight_select = FlightSelect.new end
		puts @flight.id.to_s + "<<<<<< the flight id"

		@srch = Search.new

#		from_time = @flight.from_date.strftime("%H:%M").to_s
		from_time = '12:00'
		from_date = @flight.from_date.strftime("%m/%d/%Y").to_s
#		to_time =   @flight.to_date.strftime("%H:%M").to_s
		to_time = '12:00'
		to_date = @flight.to_date.strftime("%m/%d/%Y").to_s
		
		session[:test_version]? count=nil : count=1 

#		@xml = @srch.start_kayak_search(
#			@flight.from_code, 
#			@flight.to_code,
#			from_date,from_time, to_date, to_time, count)
			
#		# grab version b value here
#		if session[:test_version] == false then
#		   @xml.elements.each('/searchresult/trips/trip') do |e| 
#		     e.each_element("price") do |t| 
#		       @low_fare = t.text		       
#		     end
#		   end
#		end

#	   @xml.elements.count < 1 ? @result_nil = true : @result_nil = false
		
		
        format.html {        
         if session[:test_version] then 
           render :action => "show_many"  
         else 
           render :action => "show"
         end
        } 
 		
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flight.errors, :status => :unprocessable_entity }
      end
    end

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
  
  def thanks
#	@flight.button_label = params[:button_label]  
	respond_to do |format|
	  format.html
	  format.xml { redirect_to(@flight) }
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
