module ApplicationHelper
  # ページに応じたタイトルを返す
  def page_titles(action_name, controller_name)
  	divider = " | "
  	baseTitle = "アラビア語検索ナビ MilaaHa"

  	if controller_name == "lessons" && action_name == "index"
  	  return "単元別単語メニュー#{divider}#{baseTitle}"
  	elsif controller_name == "lessons" && action_name == "show"
  	  return "LV#{params[:lv]}テキスト#{divider}#{baseTitle}"
    elsif controller_name == "examples" && action_name == "index"
      return "例文：#{params[:exp]}#{divider}#{baseTitle}"
  	end

    if controller_name == "users" && action_name == "new"
      return "新規ユーザー登録#{divider}#{baseTitle}"
    end

    if controller_name == "users" && action_name == "index"
      return "登録ユーザー一覧#{divider}#{baseTitle}"
    end

    if controller_name == "versions" && action_name == "index"
      return "履歴一覧#{divider}#{baseTitle}"
    end

    if controller_name == "versions" && action_name == "show"
      return "履歴詳細#{divider}#{baseTitle}"
    end

    if controller_name == "words" && action_name == "new"
      return "新規単語登録#{divider}#{baseTitle}"
    end

    if controller_name == "examples" && action_name == "new"
      return "例文追加：#{params[:exp]}#{divider}#{baseTitle}"
    end

    if controller_name == "relations" && action_name == "new"
      return "類義語登録#{divider}#{baseTitle}"
    end

    if controller_name == "sessions"
      return "ログイン#{divider}#{baseTitle}"
    end

    if controller_name == "appearances" && action_name == "new"
      return "登場単語登録#{divider}#{baseTitle}"
    end

    if controller_name == "users" && action_name == "show"
      return "ユーザー情報#{divider}#{baseTitle}"
    end

  	case action_name
  	when "home"
	  return baseTitle
  	when "words_roots"
  	  return "語根 #{params[:id]} 検索結果#{divider}#{baseTitle}"
  	when "synonym"
  	  return "類義語検索結果#{divider}#{baseTitle}"
  	when "antonym"
  	  return "対義語検索結果#{divider}#{baseTitle}"
  	when "index"
  	  return "単語 #{params[:srch_word]} 検索結果#{divider}#{baseTitle}"
  	when "word_in_lessons"
  	  return "登場箇所#{divider}#{baseTitle}"
  	when "lesson_in_words"
  	  return "LESSON内単語一覧#{divider}#{baseTitle}"
    when "edit"
      return "編集メニュー#{divider}#{baseTitle}"
    when "synsub"
      return "登録用類義語検索"
    when "edit_antonym"
      return "対義語登録#{divider}#{baseTitle}"
    when "antosub"
      return "登録用対義語検索"
    when "add_synonym"
      return "検索結果"
    when "add_word_to_lesson"
      return "登場LESSON登録#{divider}#{baseTitle}"
  	end

  end

  # LESSON系画面からの遷移かどうかを判定する
  def lesson_menu?(action_name, controller_name)
    false
    params[:action] == "show" && params[:controller] == "lessons"
  end

  # LESSON内単語一覧もしくはLESSON内登場単語登録からの遷移かどうかを判定する
  def lesson_in_words?(action_name, controller_name)
    false
    (action_name  == "lesson_in_words") || (action_name == "create" && controller_name == "appearances")
  end

  # 現在の画面がサブウィンドウかどうかを判定する
  def sub_window?(action_name)
    false
    params[:action] == "antosub" or params[:action] == "synsub" or params[:action] == "add_synonym"
  end

end
