require "open-uri"
namespace :football do
  desc "TODO"
  task fixture_fetch: :environment do
    previous_fix = Fixture.all 
    unless previous_fix.empty?
      previous_fix.each do |a|
        a.destroy
      end
    end
    @@home_team = []
    @@away_team = []
  	doc = Nokogiri::HTML(open("http://www.bbc.com/sport/football/premier-league/fixtures"))
      @count = 0
    	doc.css("div#fixtures-data td.match-details span.team-home a").each do |home|
    	  @@home_team[@count] = home.content
        @count += 1
        #@fixture.update_attributes(home_team: home.content)
      end
      @count = 0
  		doc.css("div#fixtures-data td.match-details span.team-away a").each do |away|
  			@@away_team[@count] = away.content
        @count += 1
        #@fixture.update_attributes(away_team: away.content)
  		end
      @count -= 1
      for i in 0..@count
        Fixture.create(home_team: @@home_team[i], away_team: @@away_team[i])
      end
  
  end

  desc "TODO"
  task result_fetch: :environment do
  end

end
