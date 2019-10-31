class SessionsController < ApplicationController

	def new
	end

	def create
  	# cherche s'il existe un utilisateur en base avec l’e-mail
  		user = User.find_by(email: params[:email])

  		# on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  		if user && user.authenticate(params[:password])
    		log_in(user)
    		flash.now[:success] = 'Bravo tu as bien été connecté !'
    		redirect_to welcome_path(user.first_name)
		else
    		flash.now[:error] = 'Invalid email/password combination'
    		render 'new'
  		end
	end

	def destroy
		session.delete(:user_id)
		flash.now[:error] = 'Vous vous êtes déconnecté'
		redirect_to gossips_path
	end

end
