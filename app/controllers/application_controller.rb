class ApplicationController < ActionController::Base
  class TimeOutError < StandardError; end
  class InternalServerError < StandardError; end

  rescue_from ApplicationController::TimeOutError do |exception|
    respond_to do |format|
      format.json { render json: { errors: [message: 'Request time out']}, status: 408 }
      format.html { render 'errors/time_out_error' }
    end
  end

  rescue_from ApplicationController::InternalServerError do |exception|
    respond_to do |format|
      format.json { render json: { errors: [message: 'internal server error']}, status: 500 }
      format.html { render 'errors/internal_server_error' }
    end
  end
end
