class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Suppliers.all
    render 'supplier_index.json.jbuilder'
  end 

  def create
    @supplier = Supplier.new(
                              name: params[:name]
                              email: params[:email]
                              phone_number: params[:phone_number]
                              )
    @supplier.save
    render 'supplier_show.json.jbuilder'
  end

  def show
    @supplier = Supplier.find(params[:id])
    render 'supplier_show.json.jbuilder'
  end 

  def update
    @supplier = Supplier.find(params[:id])

    @supplier.name = params[:name] || @supplier.name
    @supplier.email = params[:email] || @supplier.email
    @supplier.phone_number = params[:phone_number] || @supplier.phone_number
  end

  def delete
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
  end 
end
