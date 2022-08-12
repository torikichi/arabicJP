# frozen_string_literal: true

FactoryBot.define do
  factory :word do
    word { "فعل" }
    word_with_pron { "فَعْلّ" }
    sequence(:meaning) { |n| "日本語での意味_#{n}" }
  end
end
