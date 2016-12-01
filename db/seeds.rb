require "capybara"
require "capybara/dsl"
require 'capybara/poltergeist'

class Scraper
  include Capybara::DSL

  def run
    Capybara.default_max_wait_time = 15
    Capybara.configure do |c|
      c.javascript_driver = :poltergeist
      c.default_driver = :poltergeist
    end
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, {
        js_errors: false,
        debug: false,
        phantomjs_options: ['--debug=no', '--load-images=no', '--ignore-ssl-errors=yes', '--ssl-protocol=TLSv1'],
        timeout: 45,
        headers: { 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36" }
      })
    end

    Capybara.app_host = "http://www.linkedin.com"
    page.driver.browser.clear_cookies
    visit('/')
    sleep 1
    fill_in 'login-email', :with => 'jcjuppe@gmail.com', visible: false
    fill_in 'login-password', :with => 'lewagon1', visible: false
    click_on('login-submit')
    sleep 2

    visit('https://www.linkedin.com/directory/topics-more/')
    alpha = all(".wrapper .section:nth-child(2) a")
    elements = all(".wrapper .section:nth-child(4) a")
    letters = ('a'..'z').to_a


    alpha.count.times do |index|
      p "!!! new letter !!!"
      all(".wrapper .section:nth-child(2) a")[index].click
      sleep 1
      p "!!! go to list !!!"
      elements = all(".wrapper .section:nth-child(4) a")
      letters = ('a'..'z').to_a[index]
      elements.count.times do |index|
        begin
        p "!!! list !!!"
        all(".wrapper .section:nth-child(4) a")[index].click
        sleep 1
        all('.quad-column a').each do |link|
          p link.text
        end
        visit("https://www.linkedin.com/directory/topics-#{letters}/")
        sleep 1
        rescue
          Capybara::Poltergeist::StatusFailError
        end
      end
      visit('https://www.linkedin.com/directory/topics-more/')
      sleep 1
    end
  end
end

Scraper.new.run
