#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'
require 'mail'

url              = 'http://www.triyoga.co.uk/classes/'
classToSearchFor = 'Anusara Yoga Level 2'


options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :user_name            => 'bridgetchecker@gmail.com',
            :password             => 'isbridgetteaching',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }


page         = Nokogiri::HTML(open(url))
scheduleData = page.css('.schedule-data')
entries      = scheduleData.xpath('//tr')

teacher = nil
entries.each do |entry|
  next unless entry.to_s.match(Regexp.new(classToSearchFor))
  teacher = entry.css(".teacher_panel").css('.content_wrapper').xpath('h3')
  break
end

message = "The next Triyoga '#{classToSearchFor}' class is with #{teacher.text}"
mail = Mail.new do
  delivery_method :smtp, options
  to              'tiapio@gmail.com,yannickwurm@gmail.com,bridgetchecker@gmail.com'
  from            'bridgetchecker@gmail.com'
  subject         "#{teacher.text} at Triyoga"
  body            message
end

mail.deliver!
