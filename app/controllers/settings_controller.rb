class SettingsController < ApplicationController
  def index
    @users = User.order(:name)
  end
end
