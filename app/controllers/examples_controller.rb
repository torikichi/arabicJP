class ExamplesController < ApplicationController
  def index
	  @examples = Example.where(["word_id=?", params[:format]])
  end

  def show
    keyArray = params[:id].split(",")
  	@example = Example.find_by(word_id: keyArray[0].to_i, exp_seq: keyArray[1].to_i)
  end

  def new
  	@example = Example.new
  end

  def create
  	@example = Example.new(example_params)
  	# 例文追加は連番をincrementする
  	maxCount = Example.where(["word_id=?", @example.word_id]).maximum('exp_seq')
  	maxCount ||= 0
  	@example.exp_seq = maxCount + 1

  	if @example.save
  	  flash[:success] = "例文を追加しました！正しく追加されたか、確認してください。"
      redirect_to @example
  	else
  	  render 'new'
  	end
  end

  private
  	def example_params
  	  params.require(:example).permit(:word_id, :sentence_ja, :sentence_ar)
  	end

end