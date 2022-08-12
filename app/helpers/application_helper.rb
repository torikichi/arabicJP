# frozen_string_literal: true

module ApplicationHelper
  # ページに応じたタイトルを返す
  def page_titles(action_name, controller_name)
    divider = " | "
    base_title = "アラビア語検索ナビ MilaaHa"

    if controller_name == "lessons" && action_name == "index"
      return "単元別単語メニュー#{divider}#{base_title}"
    elsif controller_name == "lessons" && action_name == "show"
      return "LV#{params[:lv]}テキスト#{divider}#{base_title}"
    elsif controller_name == "examples" && action_name == "index"
      return "例文：#{params[:exp]}#{divider}#{base_title}"
    end

    return "新規ユーザー登録#{divider}#{base_title}" if controller_name == "users" && action_name == "new"

    return "登録ユーザー一覧#{divider}#{base_title}" if controller_name == "users" && action_name == "index"

    return "履歴一覧#{divider}#{base_title}" if controller_name == "versions" && action_name == "index"

    return "履歴詳細#{divider}#{base_title}" if controller_name == "versions" && action_name == "show"

    return "新規単語登録#{divider}#{base_title}" if controller_name == "words" && action_name == "new"

    return "例文追加：#{params[:exp]}#{divider}#{base_title}" if controller_name == "examples" && action_name == "new"

    return "類義語登録#{divider}#{base_title}" if controller_name == "relations" && action_name == "new"

    return "ログイン#{divider}#{base_title}" if controller_name == "sessions"

    return "登場単語登録#{divider}#{base_title}" if controller_name == "appearances" && action_name == "new"

    return "ユーザー情報#{divider}#{base_title}" if controller_name == "users" && action_name == "show"

    case action_name
    when "home"
      base_title
    when "words_roots"
      "語根 #{params[:id]} 検索結果#{divider}#{base_title}"
    when "synonym"
      "類義語検索結果#{divider}#{base_title}"
    when "antonym"
      "対義語検索結果#{divider}#{base_title}"
    when "index"
      "単語 #{params[:srch_word]} 検索結果#{divider}#{base_title}"
    when "word_in_lessons"
      "登場箇所#{divider}#{base_title}"
    when "lesson_in_words"
      "LESSON内単語一覧#{divider}#{base_title}"
    when "edit"
      "編集メニュー#{divider}#{base_title}"
    when "synsub"
      "登録用類義語検索"
    when "edit_antonym"
      "対義語登録#{divider}#{base_title}"
    when "antosub"
      "登録用対義語検索"
    when "add_synonym"
      "検索結果"
    when "add_word_to_lesson"
      "登場LESSON登録#{divider}#{base_title}"
    end
  end

  # LESSON系画面からの遷移かどうかを判定する
  def lesson_menu?(_action_name, _controller_name)
    params[:action] == "show" && params[:controller] == "lessons"
  end

  # LESSON内単語一覧もしくはLESSON内登場単語登録からの遷移かどうかを判定する
  def lesson_in_words?(action_name, controller_name)
    (action_name == "lesson_in_words") || (action_name == "create" && controller_name == "appearances")
  end

  # 現在の画面がサブウィンドウかどうかを判定する
  def sub_window?(_action_name)
    params[:action] == "antosub" or params[:action] == "synsub" or params[:action] == "add_synonym"
  end
end
