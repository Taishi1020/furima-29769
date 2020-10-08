require 'rails_helper'
RSpec.describe 'Item', type: :models do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('spec/image/apple-touch-icon-precomposed.png')
  end

  describe '商品の情報を入力' do
    context '出品をボタンを押した時にうまく出品できるとき' do
      it 'imageとproduct_name、product_descriptionがあるとき登録できる' do
        expect(@item).to be_valid
      end
      it 'product_nameが空白でなければ出品できること' do
        @item.product_name = '商品名'
        @item.valid?
        expect(@item).to be_valid
      end
      it 'product_descriptionが空白でなければ出品できること' do
        @item.product_description = '説明'
        @item.valid?
        expect(@item).to be_valid
      end
      it 'categoryが選択できていれば出品できること' do
        @item.category_id = '2'
        @item.valid?
        expect(@item).to be_valid
      end
      it 'product_conditionが選択できていれば出品できること' do
        @item.product_condition_id = '2'
        @item.valid?
        expect(@item).to be_valid
      end
      it 'product_burdenが選択できていれば出品できること' do
        @item.product_burden_id = '2'
        @item.valid?
        expect(@item).to be_valid
      end
      it 'ship_form_areaが選択できていれば出品できること' do
        @item.shipping_days_id = '2'
        @item.valid?
        expect(@item).to be_valid
      end
      it 'pricceが設定されていれば当ロックできること' do
        @item.price = '5000'
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '出品をボタンを押した時にうまく出品されないとき' do
      it 'product_nameが空白であれば登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors[:product_name]).to include("can't be blank")
      end
      it 'imageが空白では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end
      it 'product_descriptionが空白であれば出品ができない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors[:product_description]).to include("can't be blank")
      end
      it 'categoryが選択されていなかったら出品ができない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors[:category_id]).to include('must be other than 1')
      end
      it 'active_hashで実装しているprodcut_conditionはid:1が選択されていなかったら出品できない' do
        @item.product_condition_id = '1'
        @item.valid?
        expect(@item.errors[:product_condition_id]).to include('must be other than 1')
      end
      it 'active_hashで実装しているaciproduct_burdenはid:1が選択されていなかったら出品できない' do
        @item.product_burden_id = '1'
        @item.valid?
        expect(@item.errors[:product_burden_id]).to include('must be other than 1')
      end
      it 'active_hashで実装しているship_form_areaはid:1が選択されていなかったら出品できない' do
        @item.ship_form_area_id = '1'
        @item.valid?
        expect(@item.errors[:ship_form_area_id]).to include('must be other than 1')
      end
      it 'active_hashで実装しているshipping_daysはid:1が選択されている場合は出品できない' do
        @item.shipping_days_id = '1'
        @item.valid?
        expect(@item.errors[:shipping_days_id]).to include('must be other than 1')
      end
      it 'priceの価格は300からしか出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors[:price]).to include('Price Out of setting range')
      end
      it 'priceの価格は9999999までしか出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include('Price Out of setting range')
      end
    end
  end
end
