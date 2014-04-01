class Api::DreamSymbolsController < ApplicationController
  respond_to :json

  def index
    @dream_symbols = DreamSymbol.all
    render json: @dream_symbols
  end

  def show
    @dream_symbol = DreamSymbol.find( params[:id] )
    ap params
    respond_with @dream_symbol
  end

  def create
    @dream_symbol = DreamSymbol.new( dream_symbol_params )
    if @dream_symbol.save
      render json: @dream_symbol, status: created
    else
      render json: @dream_symbol.errors, status: :unprocessable_entity
    end
  end

  def update
    @dream_symbol = DreamSymbol.update( params[:id], dream_symbol_params )
    respond_with @dream_symbol
  end

  def destroy
    DreamSymbol.destroy( params[:id] )
    head :no_content
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def dream_symbol_params
    params.require(:dream_symbol).permit(:name, :ancestry, :description, :image)
  end
end
