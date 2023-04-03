class UsersController < ApplicationController
  def index
    matching_user = User.all
    @list_of_users = matching_user.order({:username => :asc})
    render({:template=>"user_templates/index.html.erb"})
  end
  
  def show
  url_username = params.fetch("username")
  matching_usernames = User.where({:username=>url_username})
  @the_user = matching_usernames.first
  # if the_user == nil
  #   redirect_to("/")
  # else
    render({:template=>"user_templates/show.html.erb"})
  # end
  end
  def create
    # Parameters: {"input_username"=>"ygigu", "username"=>"insert_user_record"}
    input_username = params.fetch("input_username")
    a_new_user = User.new
    a_new_user.username = input_username
    a_new_user.save
  # render({:template=>"user_templates/add_user.html.erb"})
  redirect_to("/users/#{a_new_user.username}")
  end
end
