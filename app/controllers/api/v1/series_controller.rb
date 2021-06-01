module Api
  module V1
    class SeriesController < ApplicationController
      include PaginatorHelper
      before_action :set_series, only: :show

      def index
        series = Series.joins(:tags)
        links = links('api_v1_series_index_path', params, series.size)
        total_elements = series.size
        render json: SeriesSerializer.new(series, include: [:tags], links: links, meta: meta_data(total_elements, paginator_params)).serialized_json
      end

      def create
        series = Series.new(series_params)
        if series.save
          render json: SeriesSerializer.new(series, include: [:tags]).serialized_json
        else
          render json: { msg: series.errors, status: :unprocessable_entity }
        end

      end

      def show
        render json: SeriesSerializer.new(@serie, include: [:tags]).serialized_json
      end

      private

      def series_params
        restify_param(:series).require(:series).permit(:name, :release_date, :description, :id, tags_attributes: %i[id name _destroy])
      end

      def paginator_params
        params.permit(:page, :id)
      end

      def set_series
        id = params[:id]
        @serie = Series.find_by(id: id)
        render json: {"msg": "Record #{id} not found"} if @serie.nil?
      end
    end
  end
end

