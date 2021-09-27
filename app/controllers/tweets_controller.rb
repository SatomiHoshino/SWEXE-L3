class TweetsController < ApplicationController
    def index
       @tweets = Tweet.all
    end
    
    def new
       @tweet = Tweet.new
    end
    
    def create
       message = params[:tweet][:message]
       tdate = Time.current
       
       @tweet = Tweet.new(message: message, tdate: tdate)
       if @tweet.save
           flash[:notice] = '[１メッセージ追加しました]'
           redirect_to '/'
       else
           render 'new'
       end
    end
    
    def destroy
       tweet = Tweet.find(params[:id])
       tweet.destroy
       redirect_to '/'
    end
    
    def edit
       @tweet = Tweet.find(params[:id]) 
    end
    
    def update
       @tweet = Tweet.find(params[:id])
       message = params[:tweet][:message]
       @tweet.update(message: message)
       
       if @tweet.save
           flash[:notice] = '[１メッセージ更新しました]'
           redirect_to '/'
       else
           render 'new'
       end
    end
    
    def show
       @tweet = Tweet.find(params[:id]) 
    end

end
