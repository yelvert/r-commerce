# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter :session_maintenance
  before_filter :prepare_session
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => '227de1f56b3293e0227ccb26c15cce58'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  # The expiration time.
  MAX_SESSION_TIME = 60*60*24
  
  def session_maintenance
    if !logged_in?
      if !session[:expiry_time].nil? and session[:expiry_time] < Time.now
        # Session has expired. Clear the current session.
        reset_session
      end
     
      # Assign a new expiry time, whether the session has expired or not.
      session[:expiry_time] = MAX_SESSION_TIME.seconds.from_now
      
      #destroy the stale sessions and thier associated carts in the local db
      ActiveRecord::Base.connection.execute("DELETE FROM sessions WHERE (updated_at < '#{MAX_SESSION_TIME.seconds.ago.strftime("%Y-%m-%d %H:%M:%S UTC")}');")
      ActiveRecord::Base.connection.execute("DELETE FROM carts WHERE (updated_at < '#{MAX_SESSION_TIME.seconds.ago.strftime("%Y-%m-%d %H:%M:%S UTC")}' AND user_id IS NULL);")
      #Cart.destroy_all("(updated_at < '#{MAX_SESSION_TIME.seconds.ago.strftime("%Y-%m-%d %H:%M:%S UTC")}' AND user_id IS NULL)")
    else
      
    end
    return true
  end
  
  def prepare_session
    if session["setup"].blank?
      if logged_in?
        cart = Cart.find_by_user_id(current_user.id)
        session["cart"] = !cart.nil? ? (Cart.create! :user_id => current_user.id, :session_id => session.session_id) : cart
      else
        session["cart"] = Cart.create! :session_id => session.session_id
      end
      session["setup"] = true
    end
    return true
  end

end
