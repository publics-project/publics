module MessagesHelper

  def receiver_options
    User.where(:_id.ne => current_user.id).map do |user|
      [user.email, user.id]
    end
  end

end