class V1::PortfolioController < ApplicationController
    before_action :find_portfolio, only: [:show, :update, :destroy]
    def index
      @portfolios = Portfolio.all
      render json: @portfolios
    end

    def show
    end
      render json: @portfolio
    end

    def create
      @portfolio = portfolio.new(portfolio_params)
      if @portfolio.save
       render json: @portfolio
      else
       render error: { error: 'Unable to create portfolio.'}, status: 400
      end
    end

    def update
      if @portfolio
       @portfolio.update(portfolio_params)
       render json: { message: 'portfolio successfully update.'}, status:200
      else
       render json: { error: 'Unable to update portfolio.'}, status:400
      end
    end

    def destroy
      if @portfolio
       @portfolio.destroy
       render json: { message: 'portfolio successfully deleted.'}, status:200
    else
       render json: { error: 'Unable to delete portfolio. '}, status:400
      end
    end

    private
    def portfolio_params
      params.require(:portfolio).permit(:portfolio, :likes, :user_id)
    end
    def find_portfolio
      @portfolio = portfolio.find(params[:id])
    end
end
