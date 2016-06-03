module ApplicationHelper
  # ページに応じたタイトルを返す
  def page_titles(action_name, controller_name)
  	divider = " | "
  	baseTitle = "アラビア語検索ナビ MilaaHa"

  	if controller_name == "lessons" && action_name == "index"
  	  return "単元別単語メニュー" + divider + baseTitle
  	elsif controller_name == "lessons" && action_name == "show"
  	  return "LV" + params[:lv] + "テキスト" + divider + baseTitle
    elsif controller_name == "examples" && action_name == "index"
      return "例文：" + params[:exp] + divider + baseTitle
  	end

    if controller_name == "users" && action_name == "new"
      return "新規ユーザー登録" + divider + baseTitle
    end

    if controller_name == "sessions"
      return "ログイン" + divider + baseTitle
    end

  	case action_name
  	when "home"
	  return baseTitle
  	when "wordsRoots"
  	  return "語根 "+ params[:id] +" 検索結果" + divider + baseTitle
  	when "synonym"
  	  return "類義語検索結果" + divider + baseTitle
  	when "antonym"
  	  return "対義語検索結果" + divider + baseTitle
  	when "index"
  	  return "単語 "+ params[:srchWrd] +" 検索結果" + divider + baseTitle
  	when "word_in_lessons"
  	  return "登場箇所" + divider + baseTitle
  	when "lesson_in_words"
  	  return "LESSON内単語一覧" + divider + baseTitle
  	end

  end

end
