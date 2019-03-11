class TransactionsController < ApplicationController
  def new
    @transactions = Transaction.all
  end

  def show
  end

  
end
