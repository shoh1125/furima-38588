require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
    it 'name,image,explanation,category_id,condition_id,delivery_charge_id,prefecture_id,delivery_date_id,priceが存在すれば商品出品できる' do
      expect(@item).to be_valid
     end
    end
    context '商品出品できない場合' do
    it 'nameが空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'explanationが空では出品できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'category_idが空では出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'condition_idが空では出品できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'delivery_charge_idが空では出品できない' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'prefecture_idが空では出品できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'delivery_date_idが空では出品できない' do
      @item.delivery_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end
    it 'priceが空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid!")
    end
    it 'imageが空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'priceが¥299以下では出品できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid!")
    end
    it 'priceが¥10,000,000以上では出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid!")
    end
    it 'priceに全角数字があれば出品できない' do
      @item.price = '１１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid!")
    end
    it 'category_idが1の場合出品できない'do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'condition_idが1の場合出品できない'do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'delivery_charge_idが1の場合出品できない'do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'prefecture_idが1の場合出品できない'do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'delivery_date_idが1の場合出品できない'do
      @item.delivery_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end
    it 'user_idがなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
end