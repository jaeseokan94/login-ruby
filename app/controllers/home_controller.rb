class HomeController < ApplicationController
  def index
    @k = ViewCount.new
    @k.ip_address = request.remote_ip
    @k.save
    @username = "" #초기화 initialize
    
    unless session["user_id"].nil?
      @username = User.find(session["user_id"]).username
    end
  end

  def login
  end

  def logout
      reset_session
      redirect_to '/'

  end
  
  def join_process
    u=User.new
    u.username = params[:username]
    u.password = params[:password]
    u.save
    redirect_to '/'
  end
  
  def join
  end
  
  
  
  def login_process
    u = User.where(:username => params[:username],
                   :password => params[:password]).take
    
     unless u.nil?
        session["user_id"] = u.id
     end
      #yes data then yes login
     redirect_to '/'
     
  end
end
