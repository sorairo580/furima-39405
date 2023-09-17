require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailが一意性であるとき' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれているとき' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であるとき' do
        expect(@user).to be_valid
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）であるとき' do
        expect(@user).to be_valid
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）であるとき' do
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角（カタカナ）であるとき' do
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角（カタカナ）であるとき' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmatipasswordが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationがpasswordと一致していないと登録できない' do
        @user.password = 'password1'
        @user.password_confirmation = 'password2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailがすでに登録されていると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'hogefuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '123za'
        @user.password_confirmation = '123za'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'Dazai'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'Osamu'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaが全角（カタカナ）でないと登録できない' do
        @user.last_name_kana = 'ﾀﾞｻﾞｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'ｵｻﾑ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
    end
  end
end
