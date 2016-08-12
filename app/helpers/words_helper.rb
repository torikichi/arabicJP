module WordsHelper
  # 複数形コードが未設定、かつ品詞が名詞(数詞は除く)だった場合
  # 複数形登録のリンクを活性化する
  def plural_editable?(plural_cd, pos)
  	false
  	plural_cd == 0 && (pos == "男" || pos == "女" || pos == "集" || pos == "複" || pos == "名" || pos == "形" || pos == "形女" || pos == "形男")
  end

  def cate_name(category)
  	case category
  	  when READ_NO
  	  	CATE1
  	  when WRITE_NO
  	  	CATE2
  	  when CONVERSATION_NO
  	  	CATE3
  	  when GRAMMER_NO
  	  	CATE4
  	  when SUPPLEMENT_NO
  	  	CATE5
  	end
  end
end
