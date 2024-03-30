class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # handle 404 errors with a friendly page
  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:error] = "We apologize, but this information could not be found."
    redirect_to home_path
  end

end
