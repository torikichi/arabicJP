require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(単語 読み 品詞 意味 語根)
  csv << csv_column_names
  @words.each do |word|
    csv_column_values = [
      word.word,
      word.word_with_pron,
      word.pos,
      word.meaning,
      word.root
    ]
    csv << csv_column_values
  end
end