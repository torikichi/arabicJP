# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "名前、パスワード、パスワード確認があれば有効であること" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前がなければ無効であること" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("が未入力です。")
  end

  it "名前が51字は無効であること" do
    user = FactoryBot.build(:user, name: "aaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeef")
    user.valid?
    expect(user.errors[:name]).to include("が長すぎます。")
  end

  it "名前が50字は有効であること" do
    user = FactoryBot.build(:user, name: "aaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeee")
    expect(user).to be_valid
  end

  it "名前が49字は有効であること" do
    user = FactoryBot.build(:user, name: "aaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeee")
    expect(user).to be_valid
  end

  it "重複した名前なら無効であること" do
    FactoryBot.create(:user, :duplicate_name)
    user = FactoryBot.build(:user, name: "dup_name_test")
    user.valid?
    expect(user.errors[:name]).to include("は既に使用されています。")
  end

  it "パスワードが8字は有効であること" do
    user = FactoryBot.build(:user, password: "password", password_confirmation: "password")
    expect(user).to be_valid
  end

  it "パスワードがなければ無効であること" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("が未入力です。")
  end

  it "パスワードが8字未満は無効であること" do
    user = FactoryBot.build(:user, password: "passwor")
    user.valid?
    expect(user.errors[:password]).to include("が短すぎます。")
  end

  it "パスワード確認がなければ無効であること" do
    user = FactoryBot.build(:user, password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("が未入力です。")
  end

  it "パスワードとパスワード確認が不一致なら無効であること" do
    user = FactoryBot.build(:user, password: "notgoodpass", password_confirmation: "goodpassword")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("が一致しません。")
  end

  it "重複したメールアドレス(大文字小文字別なし)なら無効であること" do
    FactoryBot.create(:user, :duplicate_email)
    user = FactoryBot.build(:user, email: "Test@exAmple.Com")
    user.valid?
    expect(user.errors[:email]).to include("は既に使用されています。")
  end

  it "フォーマットが不正なメールアドレスは無効であること" do
    user = FactoryBot.build(:user, email: "テスト@example.com")
    user.valid?
    expect(user.errors[:email]).to include("が不正です。")
  end

  it "メールアドレスが255字であれば有効であること" do
    user = FactoryBot.build(:user,
                            email: "nbvniewUJBSpsodnvcdsoivvprep9posjrij_vgifvkf439urtgjioerminfvnbhiejonvijcoijeoijigjronvi.rejiovflodmvopjreojospiwwei49gjirmvodfDISVNSNCfdcmeoproie9mbfkmmcdlsOISFNmopqwjireritu8bhfiuhdsporgfri509-69jncnheugvfdnlkdmnvkldfgmljkvmdslkvkdfjsvjFIEJI@example.com")
    user.valid?
    expect(user).to be_valid
  end

  it "メールアドレスが254字であれば有効であること" do
    user = FactoryBot.build(:user,
                            email: "nbvniewUJBSpsodnvcdsoivvprep9posrij_vgifvkf439urtgjioerminfvnbhiejonvijcoijeoijigjronvi.rejiovflodmvopjreojospiwwei49gjirmvodfDISVNSNCfdcmeoproie9mbfkmmcdlsOISFNmopqwjireritu8bhfiuhdsporgfri509-69jncnheugvfdnlkdmnvkldfgmljkvmdslkvkdfjsvjFIEJI@example.com")
    user.valid?
    expect(user).to be_valid
  end

  it "メールアドレスが256字であれば無効であること" do
    user = FactoryBot.build(:user,
                            email: "nbvniewUJBSpsodQnvcdsoivvprep9posjrij_vgifvkf439urtgjioerminfvnbhiejonvijcoijeoijigjronvi.rejiovflodmvopjreojospiwwei49gjirmvodfDISVNSNCfdcmeoproie9mbfkmmcdlsOISFNmopqwjireritu8bhfiuhdsporgfri509-69jncnheugvfdnlkdmnvkldfgmljkvmdslkvkdfjsvjFIEJI@example.com")
    user.valid?
    expect(user.errors[:email]).to include("が長すぎます。")
  end
end
