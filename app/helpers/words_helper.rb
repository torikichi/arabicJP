# frozen_string_literal: true

module WordsHelper
  # 当該単語が単数形の名詞だった場合、複数形登録のリンクを活性化する
  def plural_editable?(plural_word_id, pos)
    false
    plural_word_id.zero? && %w[男 女 集 複 名 形 形女 形男].include?(pos)
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

  def confirm_plural(word_obj)
    if word_obj.plural_word_id.nil? &&
      (word_obj.pos == "男" || word_obj.pos == "女" || word_obj.pos == "集" || word_obj.pos == "名" ||
        word_obj.pos == "形" || word_obj.pos == "形女" || word_obj.pos == "形男" || word_obj.pos == "-")
      link_to "複を確認", plural_from_singular_word_path(word_obj.id)
    elsif word_obj.plural_word_id.present?
      link_to "単を確認", words_path(word_id: word_obj.plural_word_id)
    end
  end

  def puts_synonym(relation_obj)
    link_to_if(relation_obj.type_name.present?, relation_obj.type_name, synonym_relation_path(relation_obj.rel_id)) do
      link_to "類義語を確認", synonym_relation_path(relation_obj.rel_id)
    end
  end

  def puts_antonym(relation_obj)
    link_to_if(relation_obj.type_name.present?, relation_obj.type_name,
               antonym_relation_path(relation_obj.rel_id, ant_contrast_cd: relation_obj.ant_contrast_cd)) do
      link_to "対義語を確認", antonym_relation_path(relation_obj.rel_id, ant_contrast_cd: relation_obj.ant_contrast_cd)
    end
  end
end
