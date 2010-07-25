class ItinerariesController < ApplicationController
  # GET /itineraries
  # GET /itineraries.xml
  def index
    @itineraries = Itinerary.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @itineraries }
    end
  end

  # GET /itineraries/1
  # GET /itineraries/1.xml
  def show
    @itinerary = Itinerary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @itinerary }
    end
  end

  # GET /itineraries/new
  # GET /itineraries/new.xml
  def new
    @itinerary = Itinerary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @itinerary }
    end
  end

  # GET /itineraries/1/edit
  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  # POST /itineraries
  # POST /itineraries.xml
  def create
    @itinerary = Itinerary.new(params[:itinerary])

    respond_to do |format|
      if @itinerary.save
        flash[:notice] = 'Itinerary was successfully created.'
        format.html { redirect_to(@itinerary) }
        format.xml  { render :xml => @itinerary, :status => :created, :location => @itinerary }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @itinerary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /itineraries/1
  # PUT /itineraries/1.xml
  def update
    @itinerary = Itinerary.find(params[:id])

    respond_to do |format|
      if @itinerary.update_attributes(params[:itinerary])
        flash[:notice] = 'Itinerary was successfully updated.'
        format.html { redirect_to(@itinerary) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @itinerary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1
  # DELETE /itineraries/1.xml
  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy

    respond_to do |format|
      format.html { redirect_to(itineraries_url) }
      format.xml  { head :ok }
    end
  end
end
