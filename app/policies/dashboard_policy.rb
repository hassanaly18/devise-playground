# app/policies/dashboard_policy.rb

class DashboardPolicy < ApplicationPolicy
  def index?
    user.present? && user.admin?
  end
end
