# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "testname_#{n}" }
    password { "testpassword" }
    password_confirmation { "testpassword" }
  end

  trait :duplicate_name do
    name { "dup_name_test" }
  end

  trait :duplicate_email do
    email { "test@example.com" }
  end
end
