class SearchController < ApplicationController
    def index
      @searches = Search.all
    end
  
    def create
      query = params[:query]
      user_ip = request.remote_ip
  
      return if query.blank?
  
      existing_search = find_existing_search(query)
  
      if existing_search
        # Update the existing record
        existing_search.update(query: query)
        search = existing_search
      else
        # Save the search data
        search = Search.create(query: query, user_ip: user_ip)
      end
  
      # Broadcast real-time search data
      SearchChannel.broadcast_to(search, { query: search.query, user_ip: search.user_ip })
  
      render json: { status: 'success', query: search.query, user_ip: search.user_ip }
    end
  
    def search
      @search_query = params[:query].strip.downcase
      @search_results = Search.where('LOWER(query) LIKE ?', "%#{@search_query}%")
      @searches = Search.all
  
      render 'index'
    end
  
    private
  
    def find_existing_search(query)
      # Check if a similar search exists in the database
      query_parts = query.split(' ')
  
      query_parts.length.downto(1) do |i|
        partial_query = query_parts[0, i].join(' ')
        existing_search = Search.where("query LIKE ?", "#{partial_query}%").first
  
        return existing_search if existing_search
      end
  
      nil
    end
end
  