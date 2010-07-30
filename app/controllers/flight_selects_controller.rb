class FlightSelectsController < ApplicationController
  # GET /flight_selects
  # GET /flight_selects.xml
  def index
    @flight_selects = FlightSelect.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flight_selects }
    end
  end

  # GET /flight_selects/1
  # GET /flight_selects/1.xml
  def show
    @flight_select = FlightSelect.find(params[:id], :include=>:flight)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flight_select }
    end
  end

  # GET /flight_selects/new
  # GET /flight_selects/new.xml
  def new
    @flight_select = FlightSelect.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flight_select }
    end
  end

  # GET /flight_selects/1/edit
  def edit
    @flight_select = FlightSelect.find(params[:id])
  end

  # POST /flight_selects
  # POST /flight_selects.xml
  def create
    @flight_select = FlightSelect.new(params[:flight_select])

    respond_to do |format|
      if @flight_select.save
      #  flash[:notice] = 'Your flight selection saved.'
      #  format.html { redirect_to(@flight_select) }
      format.html { redirect_to(new_survey_user_path) }
        format.xml  { render :xml => @flight_select, :status => :created, :location => @flight_select }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flight_select.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flight_selects/1
  # PUT /flight_selects/1.xml
  def update
    @flight_select = FlightSelect.find(params[:id])

    respond_to do |format|
      if @flight_select.update_attributes(params[:flight_select])
        flash[:notice] = 'FlightSelect was successfully updated.'
        format.html { redirect_to(@flight_select) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flight_select.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flight_selects/1
  # DELETE /flight_selects/1.xml
  def destroy
    @flight_select = FlightSelect.find(params[:id])
    @flight_select.destroy

    respond_to do |format|
      format.html { redirect_to(flight_selects_url) }
      format.xml  { head :ok }
    end
  end
end
