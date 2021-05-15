module Api
  module V2
    class StoresController < ApplicationController
      before_action :set_store, only: :show

      def index
        stores = Store.eager_load(:address, articles: [:category, :comments]).paginate(page: params[:page])
        render json: stores, meta: meta_pagination(stores),include: serializer_options, namespace: ::V2
      end

      def show
        render json: @store, include: serializer_options, namespace: ::V2
      end

      def serializer_options
        ['address', 'articles.category', 'articles.comments']
      end

      private

      def store_params
        params.permit(:page, :id)
      end

      def set_store
        id = params[:id]
        @store = Store.find_by(id: id)
        render json: {"msg": "Record #{id} not found"} if @store.nil?
      end

      def meta_pagination(collection)
        {
          current_page: collection.current_page,
          next_page: collection.next_page,
          prev_page: collection.previous_page,
          total_pages: collection.total_pages,
          total_count: collection.total_entries
        }
      end
    end
  end
end
