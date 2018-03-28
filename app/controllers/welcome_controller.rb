class WelcomeController < ApplicationController
  def index
    @name = "James Bond"
  end

  def hello
    render :index
  end

  def fix_hello
    redirect_to action: :index
  end

  def welcome
    render html: "Welcome to Rails"
  end

  def another_hello
    redirect_to welcome_hello_path
  end

  def demo_route
    render html: "Demo Path"
  end
end
