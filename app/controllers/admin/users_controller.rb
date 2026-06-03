# app/controllers/admin/users_controller.rb
class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_admin!

  # 1. List all users
  def index
    @users = policy_scope(User).order(id: :asc)

    authorize User
  end

  # 2. Toggle the role action
  def toggle_role
    @user = User.find(params[:id])

    authorize @user

    # Safety Guard: Prevent the logged-in admin from demoting themselves
    if @user == current_user
      redirect_to admin_users_path, alert: "Safety check: You cannot change your own role!"
      return
    end

    # Toggle between enum values
    if @user.user?
      @user.admin!
    else
      @user.user!
    end

    redirect_to admin_users_path, notice: "Successfully updated #{@user.email}'s role to #{@user.role.upcase}."
  end

  # private

  # def ensure_admin!
  #   unless current_user.admin?
  #     redirect_to root_path, alert: "Access denied!"
  #   end
  # end
end
