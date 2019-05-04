require "selenium-webdriver"
require 'csv'

sleep 1
def chrome_setup
  ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36"
  args = ["--headless", "--no-sandbox", "--disable-gpu", "--user-agent=#{ua}", "window-size=1280x800"]
  #args = ["--no-sandbox", "--disable-gpu", "--user-agent=#{ua}", "window-size=1280x800"]
  caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {args: args})
  session = Selenium::WebDriver.for :chrome, desired_capabilities: caps
  # session.manage.timeouts.implicit_wait = 30
  session
end

url = gets.chop
#url = "https://www.coursera.org/learn/machine-learning?" #sample_url1 機械学習
#url = "https://www.coursera.org/learn/language-processing?" #sample_url2　自然言語処理

time_ary = []
content_ary = []
session = chrome_setup
wait = Selenium::WebDriver::Wait.new(:timeout => 100)
session.navigate.to url
title = session.find_element(:css, '.H2_1pmnvep-o_O-weightNormal_s9jwp5-o_O-fontHeadline_1uu0gyz.max-text-width-xl.m-b-1s').text
session.find_element(:css, '.Button_1w8tm98-o_O-default_s8ym6d-o_O-md_1jvotax.m-t-1.d-block.m-x-auto').click
#wait.until {session.find_element(:css, '').displayed?}
session.find_elements(:css, '.Row_nvwp6p.SyllabusWeek.m-b-3').each do |ele|
  time_ary << ele.find_element(:css, '.Strong_gjs17i-o_O-weightBold_uvlhiv-o_O-fontBody_56f0wi.text-secondary').text.slice!(0)
  content_ary << ele.find_element(:css, '.H2_1pmnvep-o_O-weightBold_uvlhiv-o_O-bold_1byw3y2.m-b-2 ').text
end

csv_header = ["hour","content"]
CSV.open("#{title}.csv", "w") do |csv|
  csv << csv_header
  time_ary.zip(content_ary).each do |ele|
    csv << ele
  end
end

session.close
