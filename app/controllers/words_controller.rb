class WordsController < ApplicationController
  def index
  	# @words = Word.where("word = ?", params[:srchWrd])
    # @words = Word.find_by_sql(["select w.*, GROUP_CONCAT(DISTINCT(r.rel_id)) as synonym, count(a.appr_id) as lesson from words w left outer join relations r on w.id = r.word_id left outer join appearances a on w.id = a.word_id where w.word=? and r.syn_ant_cd=1 group by w.id", params[:srchWrd]])
    # @words = Word.find_by_sql(["select w.*, count(a.appr_id) as lesson from words w left outer join appearances a on w.id=a.word_id where w.word=? group by w.id", params[:srchWrd]])
    @words = Word.find_by_sql([gen_word_query + "where w.word=? group by w.id", params[:srchWrd]])
  	render '/lessons/home'
  end

  # 語根検索
  def wordsRoots
    # @words = Word.where("root = ?", params[:id])
    @words = Word.find_by_sql([gen_word_query + "where w.root=? group by w.id", params[:id]])
    render '/lessons/home'
  end

  # Lessonに紐付く単語を取得
  def lesson_in_words
    @choisedLesson = Lesson.find(params[:id])

    # srchKeys = params[:id].split('/').map(&:to_i)
    # apprArray = Appearance.where("appr_id in (?)", srchKeys).pluck(:word_id)
    # @words = Word.where("id in (?)", apprArray)

    @words = Word.eager_load(:appearances).where("appr_id=?", params[:id])
  end

  private
    def gen_word_query
      "select w.*, count(a.appr_id) as lesson from words w left outer join appearances a on w.id=a.word_id "
    end
end
