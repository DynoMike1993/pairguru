class UsersController < ApplicationController

  def top_commenters
    @decorated_users = User.joins(:weekly_comments)
                           .group('user_id')
                           .order('count(user_id) desc')
                           .decorate
                           .first(10)
                          
  end
end