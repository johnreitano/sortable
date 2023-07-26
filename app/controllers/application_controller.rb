class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token, if: :skip_verify_authenticity_token?
  # def skip_verify_authenticity_token?
  #   Rails.env.development? && params[:skip_verify_authenticity_token].present?
  # end
end
