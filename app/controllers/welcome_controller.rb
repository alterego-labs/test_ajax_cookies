class WelcomeController < ApplicationController
  protect_from_forgery with: :null_session, only: :set_value

  def index
  end

  def set_value
    cookies[:your_value] = {
      value: '100%',
      expires: 1.years.since,
      httponly: true,
      path: '/'
    }
    render json: {success: true}
  end

  def clear_value
    cookies.delete :your_value
    render json: {success: true}
  end
end
