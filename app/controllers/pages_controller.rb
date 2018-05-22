class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @records = Record.all
  end
end
