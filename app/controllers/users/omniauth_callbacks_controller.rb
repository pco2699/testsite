class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    include Devise::Controllers::Rememberable

    def facebook
        auth = request.env['omniauth.auth']
        logger.debug auth
        user = User.find_by(
            provider: auth.provider,
            uid: auth.uid
        )

        if user
            remember_me(user)
            sign_in_and_redirect user, event: :authentication
        else
            #      User.create(
            #        email: auth.info.email,
            #        provider: auth.provider,
            #        uid: auth.uid,
            #        name: auth.info.name
            #        )
            session['user_data'] = request.env['omniauth.auth']
            redirect_to new_user_registration_path
        end
    end

    def failure
        redirect_to root_path
    end
end
