class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment this if you want to force users to sign in before any other actions
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

    def homepage
      matching_articles = Article.all

      @list_of_articles = matching_articles.order({ :created_at => :desc }).to_a
      @grouped_articles = []
      @list_of_articles.each_with_index do |article, index|
        if !index.zero? && @list_of_articles[index].created_at.beginning_of_day == @list_of_articles[index - 1].created_at.beginning_of_day
          @grouped_articles.last << article
        else
          @grouped_articles << [article]
        end
      end
      render ({:template => "home/index"})
    end
end
