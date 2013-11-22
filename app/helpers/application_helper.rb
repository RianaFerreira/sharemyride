module ApplicationHelper
  def title(page_title)
    # used by the layout file to dynamically update the page title
    content_for(:title) { page_title }
  end

  def avatar_url(user)
    #create the gravitar
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)

    #link the gravitar to the user on the trip
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=mm"
  end
end
