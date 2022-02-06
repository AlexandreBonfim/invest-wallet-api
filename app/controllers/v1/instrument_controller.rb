class V1::InstrumentController < ApplicationController
    before_action :find_instrument, only: [:show, :update, :destroy]
    def index
      @instruments = Instrument.all
      render json: @instruments
    end

    def show
      render json: @instrument
    end

    def create
      @instrument = instrument.new(instrument_params)
      if @instrument.save
       render json: @instrument
      else
       render error: { error: 'Unable to create instrument.'}, status: 400
      end
    end

    def update
      if @instrument
       @instrument.update(instrument_params)
       render json: { message: 'instrument successfully update.'}, status:200
      else
       render json: { error: 'Unable to update instrument.'}, status:400
      end
    end
    
    def destroy
      if @instrument
       @instrument.destroy
       render json: { message: 'instrument successfully deleted.'}, status:200
    else
       render json: { error: 'Unable to delete instrument. '}, status:400
      end
    end
    
    private
    def instrument_params
      params.require(:instrument).permit(:instrument, :likes, :user_id)
    end
 
    def find_instrument
      @instrument = instrument.find(params[:id])
    end
end
