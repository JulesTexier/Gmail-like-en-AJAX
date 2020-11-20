class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(object:Faker::Movie.title, body:Faker::Movie.quote, read:false)
    
    if @email.save
      flash[:notice] = "Email received"
    else
      flash[:notice] = "Please try again"
    end
    
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read:true)


    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html do redirect_to root_path
      end 
      format.js do
      end
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.update(read:false)

    respond_to do |format|
      format.html do redirect_to root_path
      end 
      format.js do
      end
    end
  end
end


