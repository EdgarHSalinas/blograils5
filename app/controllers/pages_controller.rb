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
    page_params = params.require(:page).permit(:title, :body, :slug)
    @page = Page.new(page_params)
    @page.save 
    redirect_to @page

  end
end

