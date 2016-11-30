require "capybara"
require "capybara/dsl"
require 'capybara/poltergeist'

class Scraper
  include Capybara::DSL

  def run
    Capybara.default_max_wait_time = 15
    # Capybara.match = :first
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
    sleep 2
    fill_in 'login-email', :with => 'jcjuppe@gmail.com', visible: false
    fill_in 'login-password', :with => 'lewagon1', visible: false
    click_on('login-submit')
    sleep 2

    visit('https://www.linkedin.com/directory/topics-more/')

    all(".wrapper .section:nth-child(4) a").first.click
    sleep 1
    page.save_screenshot('screenshot.png')
    title = []
    all('.quad-column a').each do |link|
      title << link.text
    end
    puts title
  end
end

Scraper.new.run
