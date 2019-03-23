class ExamplesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]

  def index
	  @examples = Example.where(["word_id=?", params[:format]])
  end

  def new
  	@example = Example.new
  end

  def create
  	@example = Example.new(example_params)

  	if @example.save
  	  flash[:success] = "例文を追加しました！正しく追加されたか、確認してください。"
      redirect_to examples_path(@example.word_id, :exp => @example.word.word)
  	else
  	  render 'new'
  	end
  end

  def edit
    @example = Example.find(params[:id])
  end

  def update
    @example = Example.find(params[:id])

    if @example.update_attributes(example_params)
      flash[:success] = "更新が正しく完了しました。"
      redirect_to examples_path(@example.word_id, :exp => @example.word.word)
    else
      render 'edit'
    end
  end

  private
  	def example_params
  	  params.require(:example).permit(:word_id, :sentence_ja, :sentence_ar)
  	end

end