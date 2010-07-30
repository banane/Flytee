class SurveyUsersController < ApplicationController
  # GET /survey_users
  # GET /survey_users.xml
  def index
    @survey_users = SurveyUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @survey_users }
    end
  end

  # GET /survey_users/1
  # GET /survey_users/1.xml
  def show
    @survey_user = SurveyUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey_user }
    end
  end

  # GET /survey_users/new
  # GET /survey_users/new.xml
  def new
    @survey_user = SurveyUser.new
    @sourceid = params[:source]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey_user }
    end
  end

  # GET /survey_users/1/edit
  def edit
    @survey_user = SurveyUser.find(params[:id])
  end

  # POST /survey_users
  # POST /survey_users.xml
  def create
    @survey_user = SurveyUser.new(params[:survey_user])
    

    respond_to do |format|
      if @survey_user.save
     #   flash[:notice] = 'Your survey was successfully added.'
     #   format.html { redirect_to(@survey_user) }
         format.html { redirect_to('http://wharton.qualtrics.com/SE?SID=SV_5jQgyf6dQTq4VjC') }
        format.xml  { render :xml => @survey_user, :status => :created, :location => @survey_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /survey_users/1
  # PUT /survey_users/1.xml
  def update
    @survey_user = SurveyUser.find(params[:id])

    respond_to do |format|
      if @survey_user.update_attributes(params[:survey_user])
        flash[:notice] = 'SurveyUser was successfully updated.'
        format.html { redirect_to(@survey_user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey_user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def download
    @surveys = SurveyUser.find(:all, :conditions=>"test_version != ''")
     respond_to do |format|
       format.html
       format.xml { render :xml => @surveys}
     end
#    render :action => "download" 
  end
  

  # DELETE /survey_users/1
  # DELETE /survey_users/1.xml
  def destroy
    @survey_user = SurveyUser.find(params[:id])
    @survey_user.destroy

    respond_to do |format|
      format.html { redirect_to(survey_users_url) }
      format.xml  { head :ok }
    end
  end
end
