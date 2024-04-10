class WelcomeController < ApplicationController
  def index
    flash[:warning] ="早安你好"
  end
end
