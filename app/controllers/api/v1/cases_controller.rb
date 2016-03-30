module Api
  module V1
    class CasesController < ApplicationController
      def show
        @case = Case.find_by_id(params[:id])
        if @case.nil?
          render json: { error: 'Caso no existe'}, status: :bad_request
        end
      end
    end
  end
end