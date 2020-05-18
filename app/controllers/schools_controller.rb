class SchoolsController < ApplicationController
  before_action :authenticate_user!, except: :create

  layout "dashboard", only: :dashboard

  def dashbaord
  end
  
end