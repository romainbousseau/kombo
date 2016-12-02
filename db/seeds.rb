require "capybara"
require "capybara/dsl"
require 'capybara/poltergeist'
require 'json'

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

    # alpha = all(".wrapper .section:nth-child(2) a")
    elements = all(".wrapper .section:nth-child(4) a")
    # letters = ('a'..'z').to_a

    skills_hash = {}
    sum = 0

    filepath = 'skills.json'

    # alpha.count.times do |index|
    #   begin
    #     p "!!! new letter !!!"
    #     all(".wrapper .section:nth-child(2) a")[index].click
    #     sleep 1
    #     p "!!! go to list !!!"
    #     elements = all(".wrapper .section:nth-child(4) a")
    #     letters = ('a'..'z').to_a[index]
    #   rescue
    #     Capybara::Poltergeist::StatusFailError
    #   end

    visit('https://www.linkedin.com/directory/topics-m/')
    elements = all(".wrapper .section:nth-child(4) a")
    elements.count.times do |index|
      begin
        p "!!! list !!!"
        all(".wrapper .section:nth-child(4) a")[index].click
        sleep 1
        all('.quad-column a').each do |link|
          begin
            skills_hash[sum += 1] = link.text
            File.open(filepath, 'w') do |file|
              file.write(JSON.generate(skills_hash))
            end
            p link.text
          rescue
            Capybara::Poltergeist::StatusFailError
          end
        end
      rescue
        Capybara::Poltergeist::StatusFailError
      end
      begin
        visit('https://www.linkedin.com/directory/topics-m/')
        sleep 2
      rescue
        Capybara::Poltergeist::StatusFailError
      end
    end
  end
end

Scraper.new.run
