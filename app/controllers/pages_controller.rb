class PagesController < ApplicationController
  def index
    @pages = Page.all
  end 

  def show 
    @page = Page.find(params[:id])
    # page object is return and gets assigned to the @page instance
    # render plain: @page.title => Used to test its working in browser
  end

  def new
    @page = Page.new
  end

  def create 
    # render plain: params.to_json ==> Used to fist test 
    @page = Page.new(page_params)
    @page.save 
    redirect_to @page
  end

 def edit 
   @page = Page.find(params[:id])
 end

 def update 
   @page = Page.find(params[:id])
   @page.update(page_params)
   redirect_to @page
 end
 
 private 
    def page_params
      params.require(:page).permit(:title, :body, :slug)
    end

end

