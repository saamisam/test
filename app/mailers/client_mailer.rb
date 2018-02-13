class ClientMailer < ApplicationMailer
    # default from: "saaminathan.muralidaran@mercuryminds.com"

    def sendemail(user)
        @user = user
        mail(to: @user.user_email, subject: 'Sample Email')
    end
end
