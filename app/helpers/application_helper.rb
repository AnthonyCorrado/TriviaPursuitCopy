module ApplicationHelper

	def sign_in(user)
	    cookies.permanent[:remember_token] = user.remember_token
	    self.current_user = user
	end

	def signed_in?
	   !current_user.nil?
	end

	def sign_out
	  self.current_user = nil
	  cookies.delete(:remember_token)
	end

	def current_user=(user)
	  @current_user = user
	end

	def current_user
	  @current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
	  user == current_user
	end

	def redirect_back_or(default)
	  redirect_to(session[:return_to] || default)
	  session.delete(:return_to)
	end

	def store_location
	  session[:return_to] ||= request.url
	end
end

	def remember_token
	    cookies.signed[:remember_token] || [nil,nil]
	end

	def results
		@result = Yelp.client.search('Santa Monica', {term: 'bar trivia', limit: 20}).businesses
	end
	
	def location
		@location =  Yelp.client.search('Santa Monica', {term: 'bar trivia', limit: 1}).businesses[0].location.display_address
	end

