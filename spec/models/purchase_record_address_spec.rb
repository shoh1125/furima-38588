require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_address = FactoryBot.build(:purchase_record_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_record_address.building_name = ''
        expect(@purchase_record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_record_address.post_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_record_address.post_code = '123456７'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Post code input collectly")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_record_address.prefecture_id = '1'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture Select")
      end
      it 'municipalityが空だと保存できないこと' do
        @purchase_record_address.municipality = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_record_address.address = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_numberが空だと保存できないこと' do
        @purchase_record_address.tel_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが9桁以下だと保存できないこと' do
        @purchase_record_address.tel_number = '090'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Tel number input only number")
      end
      it 'tel_numberが12桁以上だと保存できないこと' do
        @purchase_record_address.tel_number = '090123456789'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Tel number input only number")
      end
      it 'tel_numberが半角数値のみ保存可能なこと' do
        @purchase_record_address.tel_number = '０９０１２３４５６７８'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Tel number input only number")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
   end 
  end
end
