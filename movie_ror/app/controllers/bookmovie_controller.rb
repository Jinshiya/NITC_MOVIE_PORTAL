class BookmovieController < ApplicationController
  def new
  end

  def create
  	@bookmovie = Bookmovie.new(bookmovie_params)
  end
end
