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
      it '電話番号にはハイフンが不要で11桁であれば登録できること' do
        @user_donation.phone_code = '09012345678'
        @user_donation.valid?
        expect(@user_donation).to be_valid
      end
      it '郵便番号にはハイフンが必要であること' do
        @user_donation.postal_code = '123-4567'
        @user_donation.valid?
        expect(@user_donation).to be_valid
      end
      it 'prefecture_idが選択できていれば購入ができること' do
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
      it '建物は今回任意入力のカラムになるため、建物が空でも登録できること' do
        @user_donation.building_name = ''
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
      it '電話番号が空白であれば登録できない' do
        @user_donation.phone_code = ''
        @user_donation.valid?
        expect(@user_donation.errors[:phone_code]).to include("can't be blank")
      end
      it '電話番号が11桁未満であれば登録できない' do
        @user_donation.phone_code = '09012345'
        @user_donation.valid?
        expect(@user_donation.errors[:phone_code]).to include("Phone number Input only number")
      end
      it '郵便番号の情報が空白のであれば登録できない' do
        @user_donation.postal_code = ''
        @user_donation.valid?
        expect(@user_donation.errors[:postal_code]).to include("can't be blank")
      end
      it "郵便番号にはハイフンと7桁の数字が無ければ登録できない" do
        @user_donation.prefecture_id = ''
        @user_donation.valid?
        expect(@user_donation.errors[:prefecture_id]).to include("Postal code Input correctly")
      end
      it 'active_hashで実装しているprefecture_id はid:0が選択されている場合は出品できない' do
        @user_donation.prefecture_id = '0'
        @user_donation.valid?
        expect(@user_donation.errors[:prefecture_id]).to include('must be other than 0')
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
    end
  end
end