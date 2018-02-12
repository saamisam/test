class AuthController < ApplicationController
    def index
        nonce = Api.order('created_at');#puts(nonce);
        render json: {status: true,message: 'success', data:nonce},status: :ok
        # render :json => @nonce
        # format.json {status: true,msg: 'success', data:nonce, status: :ok }

        # msg = { :status => "ok", :message => "Success!", :data => @nonce}
        # format.json  { render :json => msg } # don't do msg.to_json
    end
    
    def show
        nonce1 = Api.find(params[:id])
        render json: {status: true,message: 'success', data:nonce1},status: :ok
    end
    
    def create
        # nonce = ([*("A".."Z"),*("0".."9")]-%w(0 1 I O)).sample(128).join
        nonce = SecureRandom.hex (32)
        key = SecureRandom.hex (16)
        secret = SecureRandom.hex (16)
        # challenge_code = ([*("A".."Z"),*("0".."9")]-%w(0 1 I O)).sample(8).join
        challenge_code = SecureRandom.hex (16)
        nonce_create = Api.new(:user_email => params[:user_email],:nonce => nonce, :challenge_code => challenge_code, :keyvalue => key, :secretvalue => secret)
        if nonce_create.save
            render json: {status: true,message: 'Data Saved', data:nonce_create},status: :ok
        else
            render json: {status: false,message: 'Failed', data:nonce_create.errors},status: :unprocessable_entity
        end
    end

    def nonce
        keyandsecret = Api.select("user_email,keyvalue, secretvalue").where(["user_email = ? and challenge_code = ?", params[:user_email], params[:challenge_code]])
        # print keyandsecret
        # data1 = Array.new
        # data1['user_email'] = keyandsecret[0]['user_email']
        # data1['token']['key'] = keyandsecret[0]['keyvalue']
        # data1['token']['secret'] = keyandsecret[0]['secretvalue']
                
        render json: {status: true,message: 'success', data:keyandsecret},status: :ok
    end
   
    # private

    # def filter_params
    #     params.permit(:user_email,)
    # end
end


#doubts
#render json
#without order @nonce
#puts
#secure random
#print value in api
#array issue
#id in return
