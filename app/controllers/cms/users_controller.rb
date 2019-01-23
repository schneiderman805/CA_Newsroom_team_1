class Cms::UsersController < ApplicationController
    def update
        if params[:role].present?
            update_role
        end
    end

    private

    def update_role
        @user = User.find(params[:id])
        @user.update_attribute(:role, params[:role])
        redirect_to cms_articles_path
    end
end