class ExamplesController < ApplicationController
  def index
	@examples = Example.where(["word_id=?", params[:format]])
  end

end