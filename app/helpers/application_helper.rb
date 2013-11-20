module ApplicationHelper
  def avatar_url(user)
    #create the gravitar
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)

    #link the gravitar to the user on the trip
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=mm"
  end
end
