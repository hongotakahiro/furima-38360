require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)

      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.post_code = 5202144
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'area_idを選択していないと保存できないこと' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end

      it 'municipalityが空だと保存できないこと' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字のみでないと登録できない' do
        @purchase_address.phone_number = '０９０８３８３０５２４'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberが9桁以下だと登録できない' do
        @purchase_address.phone_number = '0908383'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end
      
      it 'phone_numberが12桁以上だと登録できない' do
        @purchase_address.phone_number = '090838305244'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id= ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end 
end