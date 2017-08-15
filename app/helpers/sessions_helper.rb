module SessionsHelper
	# 登入指定用户
	def log_in(user)
		session[:user_id] = user.id
	end 

	# 返回当前登录的用户
	def current_user
		if @current_user.nil?
  			@current_user = User.find_by(id: session[:user_id])
	    else
	    	@current_user
	    end
	    # @current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def logged_out?
		current_user.nil?
	end
end
