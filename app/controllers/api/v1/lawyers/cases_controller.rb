module Api
  module V1
    module Lawyers
      class CasesController < ApplicationController
        before_action :set_lawyer_id
        before_action :set_lawyer

        def index
          @cases = @lawyer.cases
        end

        def create
          @case = Case.new case_params
          if @lawyer.cases << @case
            render 'show.json.rabl', status: :created
          else
            render json: { error: 'Parámetros incorrectos'}, status: :unprocessable_entity
          end
        end

        def update
          @case = @lawyer.cases.find(params[:id])
          if @case.nil?
            render json: { error: 'Caso no existe'}, status: :bad_request
          else
            if @case.update_attributes(case_params)
              render 'show.json.rabl', status: :ok
            else
              render json: { error: 'Parámetros incorrectos'}, status: :unprocessable_entity 
            end
          end
        end

        private
        def case_params
          params.require(:case).permit(:name, :body)
        end
        def set_lawyer
          @lawyer = Lawyer.find(@id)
        end

        def set_lawyer_id
          @id = params[:lawyer_id]
        end
      end
    end
  end
end