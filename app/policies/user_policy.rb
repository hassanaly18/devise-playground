class UserPolicy < ApplicationPolicy
  def index?
      user.present? && user.admin?
  end

  def toggle_role?
    user.present? && user.admin?
  end

  class Scope < Scope
    def resolve
      if user&.admin?
        scope.all # Admins can look at the entire user database table
      else
        scope.none # Regular users get back absolutely nothing
      end
    end
  end
end
