class EmbedController < ApplicationController
  require 'rest-client'
  require 'omniauth-google-oauth2'

  def index
  end

  def new_message

    # current_user
    puts "start"
    @token = current_user.token
    puts "token here"
    puts @token

    if @token.nil?
      puts "Error during connection with Google API."
      redirect_to root_path
    else
      response = RestClient.get 'https://www.googleapis.com/youtube/v3/liveBroadcasts?part=snippet&broadcastStatus=all&broadcastType=all', { 'Authorization' => "Bearer #{@token}" }
      puts response
      response_json = JSON.parse(response.body)
      liveChatId = response_json['items'][0]["snippet"]["liveChatId"]
      response2 = RestClient.get "https://www.googleapis.com/youtube/v3/liveChat/messages?liveChatId=#{liveChatId}&part=snippet", { 'Authorization' => "Bearer #{@token}" }
      response2_json = JSON.parse(response2.body)
      
    end
  end
end
