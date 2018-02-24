require 'nokogiri'

c = File.open("quiz.html")

quiz = Nokogiri::HTML(c)
# puts quiz.css("div.question_text p").text

# puts quiz.css("div.answer_text").text

# puts quiz.css("div.correct_answer").text

File.open("quiz.txt", "a+") do |txt|

  quiz.css("div.question_text p").each do |question|
    txt << question.text
    txt.write "\n"
    txt.write "\n"
  end

  quiz.css("div.answer_text").each do |answer|
    txt << answer.text
    txt.write "\n"
  end

end

