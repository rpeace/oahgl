class SessionsController < ApplicationController

	def failure_message
    exception = env["omniauth.error"]
    #add login here:
    Rails.logger.info "exception: #{exception.inspect}"
    error   = exception.error_reason if exception.respond_to?(:error_reason)
    error ||= exception.error        if exception.respond_to?(:error)
    error ||= env["omniauth.error.type"].to_s
    error.to_s.humanize if error
  end

  skip_before_action :verify_authenticity_token
	def create
		auth = request.env["omniauth.auth"]
		session[:steam_uid] = auth["uid"]
		session[:provider] = auth["provider"]
		session[:steam_name] = auth["info"]["nickname"]
		session[:steam_logo] = auth["info"]["image"]
		session[:steam_profile] = auth["info"]["urls"]["Profile"]
		if User.find_by_provider_and_uid(auth["provider"], auth["uid"]) != nil
			user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Signed in!"
		else
		  redirect_to new_user_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Signed out!"
	end
end
