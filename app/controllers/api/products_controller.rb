class Api::ProductsController < ApplicationController
  def index
    @teas = Product.all
    render 'index.json.jbuilder'
  end

  def create
    @tea = Product.new(
                        name: params[:name],
                        description: params[:description],
                        image_url: params[:image_url]
                       )
    @tea.save
    render 'show.json.jbuilder'
  end

  def show
    @tea = Product.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def update
    @tea = Product.find(params[:id])

    @tea.name = params[:name] || @tea.name || @tea.name
    @tea.description = params[:description] || @tea.description
    @tea.image_url = params[:image_url] || @tea.image_url

    @tea.save

    render "show.json.jbuilder"
  end 

  def destroy
    @tea = Product.find(params[:id])
    @tea.destroy
    render json: {message: "Product successfully destroyed."}
  end 
end
