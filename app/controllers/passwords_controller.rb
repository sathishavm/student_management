class PasswordsController < ApplicationController
  before_action :set_student, only: [:create]


  def create
    session[:current_user_id] = @student.id
    redirect_to root_path, notice: 'Logged in successfully.'
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.where(email: params[:email]).first
      redirect_to login_path, flash: {error: 'Login failed.'} unless @student.present?
    end
end
