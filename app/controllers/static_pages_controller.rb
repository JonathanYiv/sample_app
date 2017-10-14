class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end

# In Plain Ruby, an empty method would do nothing
# In Rails, the behavior of its method is changed due to inheriting from ApplicationController
# When visiting /static_pages/home, Rails looks in the StaticPagesController and executes the code in the home action and then renders the view corresponding to the action