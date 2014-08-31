class WelcomeController < ApplicationController
   skip_before_filter :verify_authenticity_token, :only => :auth_callback


  def index
  end

end
