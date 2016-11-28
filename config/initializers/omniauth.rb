Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linked_in, ENV["LINKEDIN_ID"], ENV["LINKEDIN_CLIENT"], 
    :scope => "r_basicprofile r_emailaddress",
    :field => ["id", "email-address"]
end
