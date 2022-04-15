class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]
    before_action :correct_user, only: [:show, :destroy]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            redirect_to tasks_path, notice: t('.created')
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
          redirect_to user_path(current_user.id), notice: t('.updated')
        else
          render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to new_session_path, notice: t('.destroyed')
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to current_user unless current_user?(@user)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
