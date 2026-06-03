class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    skip_policy_scope
  end
end
