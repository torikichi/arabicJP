require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validation_test" do
    it '名前がなければエラー' do
    	user = User.new(name: nil)
    	user.valid?
    	expect(user.errors[:name]).to include("が未入力です。")
	  end

		it '名前が重複あったらエラー' do
			User.create(name: "john doe")
			user = User.new(name: "john doe")
			user.valid?
			expect(user.errors[:name]).to include("が重複しています。")
		end

		it '名前が50字以上はエラー' do
		end

		it 'メールアドレスが255字以上はエラー' do
		end

		it 'メールアドレスが重複(大文字小文字は無視)あったらエラー' do
		end
  end

  describe "downcase_test" do
  	it '大文字入力のメールアドレスが小文字に変換されていること' do
  	end
  end
end
