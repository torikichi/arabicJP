# frozen_string_literal: true

module LessonsHelper
  # どんな検索を行ったかを[文字列で]返す
  def action_title(action_name)
    case action_name
    when "home"
      "単語検索メニュー"
    when "words_roots"
      "語根検索結果"
    when "synonym"
      "類義語検索結果"
    when "antonym"
      "対義語検索結果"
    when "index"
      "単語検索結果：#{params[:srch_word]}"
    when "plural_from_singular"
      "複数形検索"
    end
  end
end
