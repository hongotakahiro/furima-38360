require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が上手く行く時' do
      it 'nicknameとemail、passwordとpassword_confiramation,family_name,first_name,family_name_kana,first_name_kana,date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数字混合であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'family_nameが全角文字であれば登録できる' do
        @user.family_name = '山田'
        expect(@user).to be_valid
      end
      it 'first_nameが全角文字であれば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'family_name_kanaが全角カナであれば登録できる' do
        @user.family_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カナであれば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれていない場合登録できない' do # 該当箇所
        @user.email = 'hhhhh.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 0o000
        @user.password_confirmation = 0o000
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = 123_456
        @user.password_confirmation = 123_456
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '123eeあ'
        @user.password_confirmation = '123eeあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it '名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.family_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name 全角文字を使用してください'
      end
      it 'family_name_kanaが空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it '名字のフリガナは全角でなければ登録できない' do
        @user.family_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana 全角カナ文字を使用してください'
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it '名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name 全角文字を使用してください'
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it '名前のフリガナは全角でなければ登録できない' do
        @user.first_name_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana 全角カナ文字を使用してください'
      end
      it '生年月日が空だと登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end
    end
  end
end
