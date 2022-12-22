require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '新規登録が上手く行く時' do
      it 'product_name, description, category, condition, charge, area, delivery_days, price, userが存在すれば出品できる' do
        expect(@item).to be_valid
      end

      #  it "必須項目が全てあれば登録できること" do
      #   expect(@item).to be_valid
      # end

      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        @item = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end

    context '新規登録が上手くいかない時' do
      it 'Price can not be smaller than to 300 and greatern than 9999999' do
        @item.price = 20
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '商品画像を1枚つけることが必須であること' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include { "Image can't be blank" }
      end
    end
  end
end

# require 'rails_helper'
# RSpec.describe User, type: :model do
#   before do
#     @user = FactoryBot.build(:user)
#   end

#   describe 'ユーザー新規登録' do
#     context '新規登録が上手く行く時' do
# it 'nicknameとemail、passwordとpassword_confiramation,family_name,first_name,family_name_kana,first_name_kana,date_of_birthが存在すれば登録できる' do
#   expect(@user).to be_valid
# end
# it 'passwordが6文字以上の半角英数字混合であれば登録できる' do
#   @user.password = '000aaa'
#   @user.password_confirmation = '000aaa'
#   expect(@user).to be_valid

#   it '重複したemailが存在する場合登録できない' do
#     @user.save
#     another_user = FactoryBot.build(:user)
#     another_user.email = @user.email
#     another_user.valid?
#     expect(another_user.errors.full_messages).to include('Email has already been taken')
#   end

#   it 'emailに@が含まれていない場合登録できない' do # 該当箇所
#     @user.email = 'hhhhh.com'
#     @user.valid?
#     expect(@user.errors.full_messages).to include 'Email is invalid'
#   end

#   it 'passwordが空では登録できない' do
#     @user.password = ''
#     @user.valid?
#     expect(@user.errors.full_messages).to include("Password can't be blank")
#   en
