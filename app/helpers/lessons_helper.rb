module LessonsHelper
  # どんな検索を行ったかを[文字列で]返す
  def action_title(action_name)
  	case action_name
  	when "home"
  	  return "単語検索メニュー"
  	when "wordsRoots"
  	  return "語根検索結果"
  	when "synonym"
  	  return "類義語検索結果"
  	when "antonym"
      return "対義語検索結果"
	  when "index"
      return "単語検索結果" + "："+params[:srchWrd]
  	end

  end
end
