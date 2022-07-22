class SmsController < ApplicationController
  before_action :validate_input

  def inbound
    if phone = @current_account.phone_numbers.find_by(number: params[:to])
      if ["STOP", "STOP\n", "STOP\r", "STOP\r\n"].include?(params[:text])
        Rails.cache.fetch(phone.number, expires_in: 4.hours) do
          {to: params[:to], from: params[:from]}
        end
      end

      render_response(message: "inbound sms ok")
    else
      render_response(error: "to parameter not found")
    end
  rescue StandardError => e
    render_response(error: "unknown failure")
  end

  def outbound
    cached_value = Rails.cache.fetch(params[:to])
    # remaining
    # If 50 requests in last 24 hours with same ‘from’ parameter:
    # {“message”: “”, “error”: “limit reached for from <from>”}

    if cached_value.present? && cached_value[:from] == params[:from]
      render_response(error: "sms from #{params[:from]} to #{params[:to]} blocked by STOP request")
    elsif @current_account.phone_numbers.find_by(number: params[:from])
      render_response(message: "outbound sms ok")
    else
      render_response(error: "from parameter not found")
    end
  rescue StandardError => e
    render_response(error: "unknown failure")
  end

  private

  def render_response(message: "", error: "")
    render json: { message: message, error: error }
  end

  def validate_input
    @error = false

    if params[:to].blank?
      error_message = "to is missing"
      @error = true
    elsif params[:from].blank?
      error_message = "from is missing"
      @error = true
    elsif params[:text].blank?
      error_message = "text is missing"
      @error = true
    elsif params[:to] !~ /^[0-9]{6,16}$/
      error_message = "to is invalid"
      @error = true
    elsif params[:from] !~ /^[0-9]{6,16}$/
      error_message = "from is invalid"
      @error = true
    elsif params[:text] !~ /^.{1,120}$/
      error_message = "text is invalid"
      @error = true
    end

    if @error
      render_response(error: error_message)
    end
  end
end
