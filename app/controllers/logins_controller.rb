class LoginsController < ApplicationController
	def index
		getUser = params[:user_id]
		getPwd = params[:password]
		session[:gSession] = nil
		checkUser = Login.where(user: getUser).empty?
		if !checkUser 
			checkUser = Login.where(user: getUser)
			checkUser.each do |i|
				$i_pwd = i.password
			end
		if $i_pwd === getPwd
			session[:gSession] = "a"
			redirect_to posts_path
				else
					return
			end	
		end

	end
	def new
		@newUser = Login.new
	end
	def create
		newUser = params[:user_id]
		newPwd = params[:password]
		if Login.where(user: newUser).empty?
			insertDB = Login.new
			insertDB.user = newUser
			insertDB.password = newPwd
			insertDB.save
			render :index
		else redirect_to new_login_path
		end
		
	end

end
