require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
    it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfamily_name、kana_last_nameとkana_family_name、birth_dateが存在すれば登録できる' do
      expect(@user).to be_valid
     end
    end
    context '新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
    end
    it 'nicknameが7文字以上では登録できない' do
    end
    it '重複したemailが存在する場合は登録できない' do
    end
    it 'emailは@を含まないと登録できない' do
    end
    it 'passwordが5文字以下では登録できない' do
    end
    it 'passwordが129文字以上では登録できない' do
    end
    it 'last_nameが空では登録できない' do
    end
    it 'family_nameが空では登録できない' do
    end
    it 'kana_last_nameが空では登録できない' do
    end
    it 'kana_family_nameが空では登録できない' do
    end
    it 'birth_dateが空では登録できない' do
    end
  end
end
end