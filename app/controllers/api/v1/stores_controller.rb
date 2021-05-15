module Api
  module V1
    class StoresController < ApplicationController
      include PaginatorHelper
      before_action :set_store, only: :show

      def index
        stores = Store.eager_load(:address, articles: [:category, :comments])
        links = links('api_v1_stores_path', params, stores.size)
        render json: StoreSerializer.new(stores, include: serializer_options, links: links, meta: meta_data(stores.size, store_params)).serialized_json
      end

      def show
        render json: StoreSerializer.new(@store, include: serializer_options).serialized_json
      end

      private

      def serializer_options
        %i[address articles.category articles.comments]
      end

      def store_params
        params.permit(:page, :id)
      end

      def set_store
        id = params[:id]
        @store = Store.find_by(id: id)
        render json: {"msg": "Record #{id} not found"} if @store.nil?
      end
    end
  end
end
