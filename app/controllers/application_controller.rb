class ApplicationController < ActionController::API
  before_action :authenticate_request!

  def authenticate_request!
    # Allow only POST HTTP verb
    if request.method != "POST"
      render json: { error: "Method Not Allowed", status: 405 }
    end
  end
end
