require 'rails_helper'
RSpec.describe "User", type: :models do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが6文字以下であれば登録できること" do
        @user.nickname = "123456"
        @user.valid?
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できること" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameがない場合は登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end
      it "emailがない場合は登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end
      it "passwordがない場合は登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない
      " do
        @user.password_confirmation  = ""
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end
  end
end

  

    