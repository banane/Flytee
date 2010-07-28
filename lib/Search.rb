require 'net/http'
require 'rexml/document' 
require 'uri'

class Search
  @@hostname = 'api.kayak.com'
  @@port = 80
  @@token = '92Dt_nblxFAzwnwRX5ENYw'
  @@lastcount = 0
  
  @@global_xml = REXML::Document.new

  def start_kayak_search(from_code, to_code, from_date, from_time, to_date, to_time, count)
	
    token ='92Dt_nblxFAzwnwRX5ENYw'
    sid = getsession(token);

	# should pass in # of travelers
     
    from_date = URI.escape(from_date)
    from_time = URI.escape(from_time)
    to_date = URI.escape(to_date)
    to_time = URI.escape(to_time)
    travelers = 1
     
    url = "/s/apisearch?basicmode=true&oneway=n&origin=#{from_code}&destination=#{to_code}&destcode=&depart_date=#{from_date}&depart_time=#{from_time}&return_date=#{to_date}&return_time=#{to_time}&travelers=#{travelers}&cabin=f&action=doflights&apimode=1"
    if count
      url += "&c=#{count}"
    end
	url += "&_sid_=#{sid}"
						
    searchid = nil
    Net::HTTP.start(@@hostname, @@port) do |http|
      response = http.get(url)
      puts "http://#{@@hostname}#{url}"
      body = response.body      
      query_xml = REXML::Document.new(body)
      searchid = query_xml.elements['//searchid']
      if searchid 
        searchid = searchid.text
      end
    end    
       
    more = poll_results(searchid, sid)
    while more == 'true' do
      more = poll_results(searchid, sid)
      puts "more to come: #{more} "
      sleep(3)
    end
  
    #one final call to get all results (instead of only 10)
    poll_results(searchid, sid)
	return @@global_xml 
  end
  
  def poll_results(searchid, sid)
    search_url = "/s/apibasic/flight?searchid=#{searchid}&apimode=1&_sid_=#{sid}"
    Net::HTTP.start(@@hostname, @@port) do |http|
      response = http.get(search_url)
      puts "http://#{@@hostname}#{search_url}"
      body = response.body      
      @@global_xml = REXML::Document.new(body)
    end
    more = @@global_xml.elements['/searchresult/morepending']
	return more
  end
	
  def getsession(token)
    sid = ""
    Net::HTTP.start(@@hostname, @@port) do |http|
      response = http.get("/k/ident/apisession?token=#{token}")
  	  puts "http://#{@@hostname}/k/ident/apisession?token=#{token}"
  	  body = response.body
  	  xml = REXML::Document.new(body)
  	  sid = xml.elements['//sid'].text
    end
    return sid
  end
  
  
end