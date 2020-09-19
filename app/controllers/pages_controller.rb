class PagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home; end

  def dashboard; end

  def sentry_test
    1 / 0
  end
end
