class ApplicationController < ActionController::Base
  before_action :set_locale


  private
    def set_locale
      if params[:locale].present?
        locale = params[:locale].downcase.to_sym

        I18n.locale = I18n.available_locales.include?(locale) ?
          locale : I18n.default_locale
      end
    end



  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
