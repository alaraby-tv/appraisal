class HomeController < ApplicationController
  def index
    @group = Group.first
    redirect_to current_user.group unless current_user.admin
  end

  def contact
  end
end
