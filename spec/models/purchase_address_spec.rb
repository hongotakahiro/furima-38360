require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'area_idを選択していないと保存できないこと' do
      end
      it 'municipalityが空だと保存できないこと' do
      end
      it 'addressが空だと保存できないこと' do
      end
      it 'phone_numberが空だと保存できないこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end

      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
