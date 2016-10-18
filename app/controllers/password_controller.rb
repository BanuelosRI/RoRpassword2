class PasswordController < ApplicationController

  def check

    if cookies[:count].nil?
      cookies[:count] = 0
    end

    @counter = cookies[:count]

    @user_id = params[:userid]
    @password = params[:password]

    if (user_valid == true) && (password_valid == true)
      @result = "Credentials are acceptable"
    else
      cookies[:count] = @counter.to_i + 1
      @counter = cookies[:count]
      @result = "Try again!! You entered username: #{@user_id} and password: #{@password}."
    end


  end

  #this checks if the user id is valid, with 7 charachters and must include ! orv $
  def user_valid
    @user_id.length >= 7 && (@user_id.include?("!") || @user_id.include?("$"))
  end

  #this checks if the password is valid, with 7 charachters and must include ! orv $
  def password_valid
    @password.length >= 7 && (@password.include?("!") || @password.include?("$"))
  end

  def reset
    cookies[:count] = 0
    @counter = cookies[:count]
    render "check.html.erb"
  end

end
