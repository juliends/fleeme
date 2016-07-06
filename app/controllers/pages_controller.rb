class PagesController < ApplicationController

  def test
    # require 'open-uri'
    # require 'json'

    # result = open('http://requestb.in/1gf6ago1?')
    # a = result.lines { |f| f.each_line {|line| p line} }

    # answer = {"event_id":"Fg6W4RzAKJ","event_type":"form_response","form_response":{"form_id":"QyqJ49","token":"418b77cbcaa09afe226f6f6d95e0c8f3","submitted_at":"2016-07-06T09:11:53Z","calculated":"null","answers":[{"type":"text","text":"75011","field":{"id":"25424220","type":"short_text"}},{"type":"text","text":"Paris","field":{"id":"25424218","type":"short_text"}},{"type":"email","email":"julien.da.silva@hotmail.com","field":{"id":"25423473","type":"email"}},{"type":"text","text":"12345","field":{"id":"25425783","type":"short_text"}},{"type":"text","text":"Da Silva","field":{"id":"25108413","type":"short_text"}},{"type":"text","text":"13 rue Paul Bert","field":{"id":"25423131","type":"short_text"}},{"type":"choice","choice":{"label":"Plus d'1 an"},"field":{"id":"25425854","type":"multiple_choice"}},{"type":"text","text":"Julien","field":{"id":"25108292","type":"short_text"}}]}}

    # url = "https://api.typeform.com/v1/form/QyqJ49?key=6d53c527661a0a32263fcc3c4d7b4f90b4b5e33e"
    # response = answer
    # infos = JSON.parse(response)
    # raise
  end
end

