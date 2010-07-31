class FareHistoriesController < ApplicationController
  # GET /fare_histories
  # GET /fare_histories.xml
  def index
    @fare_histories = FareHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fare_histories }
    end
  end

  # GET /fare_histories/1
  # GET /fare_histories/1.xml
  def show
    @fare_history = FareHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fare_history }
    end
  end

  # GET /fare_histories/new
  # GET /fare_histories/new.xml
  def new
    @fare_history = FareHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fare_history }
    end
  end

  # GET /fare_histories/1/edit
  def edit
    @fare_history = FareHistory.find(params[:id])
  end

  # POST /fare_histories
  # POST /fare_histories.xml
  def create
    @fare_history = FareHistory.new(params[:fare_history])

    respond_to do |format|
      if @fare_history.save
        flash[:notice] = 'FareHistory was successfully created.'
        format.html { redirect_to(@fare_history) }
        format.xml  { render :xml => @fare_history, :status => :created, :location => @fare_history }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fare_history.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def log
    # gets latest fare
    @itinerary_id = params["it"]
    @search = Search.new
   
    
    from_date = itinerary.dept_date.strftime("%m/%d/%Y").to_s
    from_time = itinerary.dept_date.strftime("%H:%M").to_s
    to_date = itinerary.ret_date.strftime("%m/%d/%Y").to_s
    to_time = itinerary.ret_date.strftime("%H:%M").to_s
    from_code = itinerary.route.dept_code
    to_code = itinerary.route.to_code
    
    offer_date = Date.now
    count = 1 #just grab lowest fare
    
    @xml = @srch.start_kayak_search(
    	@flight.from_code, 
    	@flight.to_code,
    	from_date,from_time, to_date, to_time,count)
    	
    # get price
    @xml.elements.each("/searchresult/trips/trip") do |e|
      e.each_element("price") do |t| 
        @price = t.text
      end
    end
	
	@farehistory = FareHistory.new(:fare => @price, :itinerary_id => @itinerary_id, :offer_date => offer_date)
        
  end

  # PUT /fare_histories/1
  # PUT /fare_histories/1.xml
  def update
    @fare_history = FareHistory.find(params[:id])

    respond_to do |format|
      if @fare_history.update_attributes(params[:fare_history])
        flash[:notice] = 'FareHistory was successfully updated.'
        format.html { redirect_to(@fare_history) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fare_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fare_histories/1
  # DELETE /fare_histories/1.xml
  def destroy
    @fare_history = FareHistory.find(params[:id])
    @fare_history.destroy

    respond_to do |format|
      format.html { redirect_to(fare_histories_url) }
      format.xml  { head :ok }
    end
  end
end
