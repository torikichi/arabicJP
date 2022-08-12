# frozen_string_literal: true

require "rails_helper"

RSpec.describe Word, type: :model do
  it "単語、シャクル付き単語、意味があれば有効であること" do
    expect(FactoryBot.build(:word)).to be_valid
  end

  it "単語がなければ無効であること" do
    word = FactoryBot.build(:word, word: nil)
    word.valid?
    expect(word.errors[:word]).to include("が未入力です。")
  end

  it "単語がアラビア語でなければ無効であること" do
    word = FactoryBot.build(:word, word: "ニホンゴ。")
    word.valid?
    expect(word.errors[:word]).to include("が不正です。")
  end

  it "シャクル付き単語がなければ無効であること" do
    word = FactoryBot.build(:word, word_with_pron: nil)
    word.valid?
    expect(word.errors[:word_with_pron]).to include("が未入力です。")
  end

  it "シャクル付単語がアラビア語でなければ無効であること" do
    word = FactoryBot.build(:word, word_with_pron: "arabic language")
    word.valid?
    expect(word.errors[:word_with_pron]).to include("が不正です。")
  end

  it "意味がなければ無効であること" do
    word = FactoryBot.build(:word, meaning: nil)
    word.valid?
    expect(word.errors[:meaning]).to include("が未入力です。")
  end

  it "語根がアラビア語でなければ無効であること" do
    word = FactoryBot.build(:word, root: "ごこん")
    word.valid?
    expect(word.errors[:root]).to include("が不正です。")
  end

  it "語根が1字であれば無効であること" do
    word = FactoryBot.build(:word, root: "م")
    word.valid?
    expect(word.errors[:root]).to include("が不正です。")
  end

  it "語根が4字であれば有効であること" do
    expect(FactoryBot.build(:word, root: "ترجم")).to be_valid
  end

  it "語根が5字であれば無効であること" do
    word = FactoryBot.build(:word, root: "قراءة")
    word.valid?
    expect(word.errors[:root]).to include("が長すぎます。")
  end

  it "フォーム内容を変えずに変更は無効であること" do
    word = FactoryBot.create(:word)
    word.update(
      word: word.word,
      word_with_pron: word.word_with_pron,
      meaning: word.meaning
    )

    expect(word.errors[:base]).to include("内容を変更/修正してください")
  end
end
