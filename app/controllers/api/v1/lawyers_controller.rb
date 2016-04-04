module Api
  module V1
    class LawyersController < ApplicationController
      def index
        @lawyers = Lawyer.all
      end

      def show
        @lawyer = Lawyer.find_by_id(params[:id])
        if @lawyer.nil?
          render json: { error: 'Abogado no existe'}, status: :bad_request
        end
      end


      def create
        @lawyer = Lawyer.new lawyer_params
        if @lawyer.save
          render'show.json.rabl', status: :created
        else
          render json: { error: 'Parámetros incorrectos'}, status: :unprocessable_entity
        end
      end

      def update
        @lawyer = Lawyer.find(params[:id])
        if @lawyer.update_attributes(lawyer_params)
          render 'show.json.rabl', status: :ok
        else
          render json: { error: 'Parámetros incorrectos'}, status: :unprocessable_entity
        end
      end

      def destroy
        @lawyer = Lawyer.find_by_id(params[:id])
        if not @lawyer.nil?
          @lawyer.destroy
          render "show.json.rabl", status: :no_content
        else
          render json: { error: 'El abogado no existe'}, status: :bad_request
        end
      end
      private
      def lawyer_params
        params.require(:lawyer).permit(:name, :specialty, :title, :age)
      end
    end
  end
end