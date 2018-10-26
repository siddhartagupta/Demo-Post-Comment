class WelcomeController < ApplicationController
  def index
  	@poast_all=Post.all.order(created_at: :desc)
  	@image_all=Image.all.order(created_at: :desc)
  end
end
