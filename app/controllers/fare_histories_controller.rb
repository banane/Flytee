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
