class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    search_term = params[:searach]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]

    @teas = Product.all

    category_name = params[:category]
    if category_name
      category = Category.find_by(name: category_name)
      @teas= category.products
    end 

    if search_term
      @teas = @teas.where("name iLIKE ?", "%#{search_term}%"                     ) 
    end 

    if sort_order && sort_attribute
      @teas = @teas.order(sort_attribute => sort_order)
    elsif sort_attribute
      @teas = @teas.order(sort_attribute)
    end 

    render 'index.json.jbuilder'
  end

  def create
    @tea = Product.new(
                        name: params[:name],
                        price: params[:price],
                        description: params[:description],
                       )
    if @tea.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @tea.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @tea = Product.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def update
    @tea = Product.find(params[:id])

    @tea.name = params[:name] || @tea.name || @tea.name
    @tea.description = params[:description] || @tea.description
    @tea.price = params[:price] || @tea.price


    if @tea.save
      render "show.json.jbuilder"
    else
      render json: {errors: @tea.errors.full_messages}, status: :unprocessable_entity
    end 
  end 

  def destroy
    @tea = Product.find(params[:id])
    @tea.destroy
    render json: {message: "Product successfully destroyed."}
  end 
end
