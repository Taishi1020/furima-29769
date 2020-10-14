require 'rails_helper'
RSpec.describe 'UserDonation', type: :models do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    item.image = fixture_file_upload('spec/image/apple-touch-icon-precomposed.png')
    @user_donation = FactoryBot.build(:user_donation,user_id:user.id ,item_id:item.id)
  end

  describe ' 購入の情報を入力' do
    context  'クレジットカードの情報をうまくPAY.JPに送れているとき' do
      it 'CVCとnumberとexp_monthとexp_year' do
       expect(@user_donation).to be_valid
      end
      it '電話番号が空白でなければ登録できること' do
        @user_donation.phone_code = '09012345678'
        @user_donation.valid?
        expect(@user_donation).to be_valid
      end
      it '郵便番号が空白でなけれな登録できること' do
        @user_donation.postal_code = '11-123'
        @user_donation.valid?
        expect(@user_donation).to be_valid
      end
      it '都道府県が空白でなければ登録できること' do
        @user_donation.prefecture_id = '2'
        @user_donation.valid?
        expect(@user_donation).to be_valid
      end
      it '市区町村が空白でなければ登録できること' do
        @user_donation.city = '東京'
        @user_donation.valid?
        expect(@user_donation).to be_valid
      end
      it '番地が空白でなけれな登録できること' do
        @user_donation.addresses = '1-1'
        @user_donation.valid?
        expect(@user_donation).to be_valid
      end
      it '建物の名前が空白でなければ登録できること' do
        @user_donation.building_name = '東京ビル'
        @user_donation.valid?
        expect(@user_donation).to be_valid
      end
    end
    
    context 'クレジットカードの情報がうまくPAY.JPに送れていない時' do
      it 'クレジットカードの情報が空白であれば登録できない' do
        @user_donation.token = ''
        @user_donation.valid?
        expect(@user_donation.errors[:token]).to include("can't be blank")
      end
      it '電話番号の情報が空白であれば登録できない' do
        @user_donation.phone_code = ''
        @user_donation.valid?
        expect(@user_donation.errors[:phone_code]).to include("can't be blank")
      end
      it '郵便番号の情報が空白のであれば登録できない' do
        @user_donation.postal_code = ''
        @user_donation.valid?
        expect(@user_donation.errors[:postal_code]).to include("can't be blank")
      end
      it '都道府県の情報が空白であれば登録できない' do
        @user_donation.prefecture_id = ''
        @user_donation.valid?
        expect(@user_donation.errors[:prefecture_id]).to include("can't be blank")
      end
      it '市区町村の情報が空白であれば登録できない' do
        @user_donation.city = ''
        @user_donation.valid?
        expect(@user_donation.errors[:city]).to include("can't be blank")
      end
      it '番地の情報が空白であれな登録できない' do
        @user_donation.addresses = ''
        @user_donation.valid?
        expect(@user_donation.errors[:addresses]).to include("can't be blank")
      end
      it '建物の名前の情報が空白であれば登録できない' do
        @user_donation.building_name = ''
        @user_donation.valid?
        expect(@user_donation.errors[:building_name]).to include("can't be blank")
      end
    end
  end
end