module UsersHelper
  def user_has_photo?
    (current_user.linkedin_picture_url.nil? || current_user.linkedin_picture_url.blank?) == false
  end
end
