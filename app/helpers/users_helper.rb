module UsersHelper
  def follow_link
    link_to "Follow", follow_user_path(@user.id), remote: true,  class: "btn btn-info"
  end

  def unfollow_link
    link_to "Unfollow", unfollow_user_path(@user.id), remote: true,  class: "btn btn-info"
  end
end
