Rails.application.routes.draw do
  post "inbound/sms", to: "sms#inbound"
  post "outbound/sms", to: "sms#outbound"

  get "unit_report/:year", to: "reports#unit_report"
end
