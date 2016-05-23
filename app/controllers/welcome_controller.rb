class WelcomeController < ApplicationController

  layout 'home'

  def index
    @works = Work.all
  end
end
