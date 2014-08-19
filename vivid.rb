require 'nokogiri'
require 'csv'

c = File.open("lakers.html")
schedule = Nokogiri::HTML(c)


CSV.open("lakers.csv", "a+") do |csv|

  schedule.css("div.productionsDay").zip(schedule.css("div.productionsDate"), schedule.css("div.productionsTime"), schedule.css("div.productionsEvent")).each do |day, date, time, event|
    csv << [day.text, date.text, time.text, event.text]
  end

end