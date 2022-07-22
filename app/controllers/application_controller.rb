class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  before_action :authenticate_request!

  def authenticate_request!
    # Allow only POST HTTP verb
    if request.method != "POST"
      render json: { error: "Method Not Allowed", status: 405 }
    end

    # Basic Autth
    authenticate_or_request_with_http_basic do |username, password|
      # username == "azr1" && password == "20S0KPNOIM"
      @current_account = Account.find_by(username: username, auth_id: password)
      if @current_account.blank?
        render json: { error: "Authentication Failed", status: 403 }
      end

      true
    end
  end
end
