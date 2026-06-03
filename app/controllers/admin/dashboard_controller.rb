class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    skip_policy_scope
    authorize :dashboard, :index?
    @users_count = User.count
    @user_growth = User.group_by_day(:created_at, range: 30.days.ago..Time.current).count
  end
end
