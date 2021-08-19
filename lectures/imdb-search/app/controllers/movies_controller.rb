class MoviesController < ApplicationController
  def index
    @movies =
      if params[:query].blank?
        Movie.all
      else
        # === PG SEARCH APPROACH ===
        # Movie.search_by_title_and_synopsis(params[:query]).with_pg_search_highlight

        ## Searches through movies and directors table:
        Movie.global_search(params[:query])

        # === SQL APPROACH ===

        ## Only matches exact title:
        # Movie.where(title: params[:query])

        # sql_query = <<-SQL
        #   title @@ :q
        #   OR synopsis @@ :q
        #   OR directors.first_name @@ :q
        #   OR directors.last_name @@ :q
        # SQL

        # Movie.joins(:director).where(sql_query, q: "%#{params[:query]}%")
      end
  end
end
