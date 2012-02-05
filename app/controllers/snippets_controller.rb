class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.page(params[:page]).per(params[:per]) 
  end

  def show
    @snippet = Snippet.find_by_hash_code params[:hash_code]
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new params[:snippet]
    if @snippet.save
      redirect_to "/#{@snippet.hash_code}"
    else
      puts @snippet.errors.messages.inspect
      redirect_to new_snippet_path @snippet
    end
  end
end
