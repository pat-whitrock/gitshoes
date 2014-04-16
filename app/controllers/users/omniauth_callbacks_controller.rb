class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def github
		request_env = request.env['omniauth.auth']
		@user = User.find_for_github_oauth(request_env)

		if @user.persisted?
			if @user.token != request_env['credentials']['token']
				@user.update_attributes(:token => request_env['credentials']['token'])
			end

			sign_in_and_redirect @user, :event => :authentication
			set_flash_message(:notice, :success, :kind => 'Github') if is_navigational_format?
		else
			session['devise.github_data'] = request_env
			redirect_to new_user_registration_url
		end
	end

end