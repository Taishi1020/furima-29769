require 'rails_helper'
RSpec.describe 'User', type: :models do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが6文字以下であれば登録できること' do
        @user.nickname = '123456'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a123456'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'first_nameが全角であれば登録ができること' do
        @user.first_name = '山田'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'last_nameが全角であれば登録ができること' do
        @user.last_name = '太郎'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'first_name_kanaがカタカナであれば登録できること' do
        @user.first_name_kana = 'ヤマダ'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'last_name_kanaがカタカナであれば登録ができること' do
        @user.last_name_kana = 'タロウ'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'emailは一意性であること' do
        @user.email = 'kkk@gmail.com'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'emailは＠を含む必要がある' do
        @user.email = 'kkk@gmail.com'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'birthdayが空白ではなければ設定できること' do
        @user.birthday = '19991020'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameがない場合は登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end
      it 'birthdayがない場合は登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors[:birthday]).to include("can't be blank")
      end
      it 'emailがない場合は登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end
      it 'emailに@がない場合は登録できない' do
        @user.email = 'kkkgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが重複している場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordがない場合は登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors[:password]).to include('Password Include both letters and numbers.')
      end
      it 'passwoedが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors[:password]).to include('Password Include both letters and numbers.')
      end
      it 'first_nameが全角で無ければ登録ができない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors[:first_name]).to include('First name Full-width characters.')
      end
      it 'last_nameが全角で無ければ登録できない' do
        @user.last_name = 'bbb'
        @user.valid?
        expect(@user.errors[:last_name]).to include('Last name Full-width characters.')
      end
      it 'first_name_kanaがカタカナで無ければ登録できない' do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include('First name kana full-width katakana characters.')
      end
      it 'last_name_kanaがカタカナで無ければ登録できない' do
        @user.last_name_kana = 'いいい'
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include('Last name kana last-width katakana characters.')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end
  end
end
