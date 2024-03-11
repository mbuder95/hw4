class EntriesController < ApplicationController

  def index
      @posts = Post.all
    end

  def new
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry.uploaded_image.attach(params["uploaded_image"])
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = @current_user["id"]
      @entry.save
      redirect_to "/places/#{@entry["place_id"]}"
    else
      flash["notice"] = "Login first."
      redirect_to "/login"
    end
  end
  

end
