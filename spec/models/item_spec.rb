require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.user = @user
  end

  describe '商品出品' do
    context '商品を出品できるとき' do
      it '写真が1枚添付されている及び商品名・価格・商品説明・カテゴリー・状態・配送料・配送期間・配送元が入力されている' do
        expect(@item).to be_valid
      end
      it '価格が300円～9,999,999円の範囲である' do
        expect(@item.price).to be >= 300
        expect(@item.price).to be <= 9_999_999
      end
    end
    context '商品を出品できないとき' do
      it '写真が添付されていない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が入力されていない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '価格が入力されていない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品説明が入力されていない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリーが入力されていない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '状態が入力されていない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料が入力されていない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it '配送期間が入力されていない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it '配送元が入力されていない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '価格が300円未満では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格に半角数字以外が含まれている場合は出品できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @item.price = '50a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
