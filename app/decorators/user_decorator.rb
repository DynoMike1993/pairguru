class UserDecorator < Draper::Decorator
  delegate_all

  def commented_movies
    if weekly_comments.length == 1
      "#{email} commented #{weekly_comments.length} movie this week"
    else
      "#{email} commented #{weekly_comments.length} movies this week"
    end
  end
end
