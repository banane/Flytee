require 'test_helper'

describe Search do

  before(:each) do
    @search = Search.new
    @from_code = "OAK"
    @to_code = "JFK"
    @from_date = "01/01/2011"
    @to_date = "02/01/2011"
  end

  
  it "should start search and not be nil" do
    @search.start_kayak_search(@from_code, @to_code, @from_date, @to_date).should_not eql(nil) 
      
  end
  
  
  it "shouldn't return a nil session" do
    token = '92Dt_nblxFAzwnwRX5ENYw'
    @sid = @search.getsession(token)
    @sid.should_not eql(nil)
    
  end
 
 
  it "should create a flightsearch url" do
    @searchid = @search.create_search_url(@sid,"N",@from_code, @to_code, @from_date, @to_date, 1).should_not eql(nil)
  end
  
  it "should poll the results" do 
    @more = @search.poll_results(@sid,@searchid,10)
    @more.should_not eql(nil)
  end

end