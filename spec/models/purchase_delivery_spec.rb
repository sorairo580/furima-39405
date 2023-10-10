require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入記録' do
    context '商品を購入できるとき' do
      it 'クレジットカード情報が入力されており、配送先情報がすべて入力されている' do
        expect(@purchase_delivery).to be_valid
      end
      it '郵便番号が「３桁‐４桁」の文字列で入力されている' do
        expect(@purchase_delivery.zip_cord).to be_valid
      end
      it '電話番号が１０桁以上１１桁以内の半角数値で入力されている（ハイフンなし）' do
        expect(@purchase_delivery.phone_number).to be >= 0000000000
        expect(@purchase_delivery.phone_number).to be <= 99999999999
      end
      it '建物名が空でも購入できる' do
        @purchase_delivery.building_name = ''
        expect(@purchase_delivery).to be_valid
      end
    end
    context '商品を購入できないとき' do
      it 'カード番号が入力されていない' do
        @purchase_delivery.card_number = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Card number can't be blank")
      end
      it '有効期限（月）が入力されていない' do
        @purchase_delivery.card_expiry_month = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Card expiry month can't be blank")
      end
      it '有効期限（年）が入力されていない' do
        @purchase_delivery.card_expiry_year = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Card expiry year can't be blank")
      end
      it '郵便番号が入力されていない' do
        @purchase_delivery.zip_cord = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Zip cord can't be blank")
      end
      it '郵便番号が「３桁‐４桁」の文字列で入力されていない' do
        @purchase_delivery.zip_cord = '123-456７'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Zip cord is invalid")
      end
      it '郵便番号にハイフンが入力されていない' do
        @purchase_delivery.zip_cord = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Zip cord is invalid")
      end
      it '都道府県が入力されていない' do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が入力されていない' do
        @purchase_delivery.city = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていない' do
        @purchase_delivery.house_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が入力されていない' do
        @purchase_delivery.phone_number = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が１０桁以上１１桁以内の半角数値で入力されていない' do
        @purchase_delivery.phone_number = '090123456'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が１０桁以上１１桁以内の半角数値で入力されていない' do
        @purchase_delivery.phone_number = '090-1234-5678'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が１０桁以上１１桁以内の半角数値で入力されていない' do
        @purchase_delivery.phone_number = '090123456７'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end