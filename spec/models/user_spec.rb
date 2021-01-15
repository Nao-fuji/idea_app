require 'rails_helper'

RSpec.describe User, type: :model do
  describe "create" do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録が上手く行く時' do
        it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,phone_numberが全て存在する' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上のとき' do
          @user.password = 'abc123'
          @user.password_confirmation = 'abc123'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end
        it 'emailが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end
        it 'emailが重複していると登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
        end
        it 'emailに@を使用していないと登録できない' do
          @user.email = 'hogehoge'
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールは不正な値です')
        end
        it 'passwordが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードには英字と数字の両方を含めて設定してください", "パスワード（確認用）とパスワードの入力が一致しません")
        end
        it 'password_confirmationがpasswordと一致していなければ登録できない' do
          @user.password = 'abc000'
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
        it 'passwordが5文字以下だと登録できない' do
          @user.password = 'abc00'
          @user.password_confirmation = 'abc00'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end
        it 'passwordが半角英数字で入力されていないと登録できない' do
          @user.password = '000000'
          @user.password_confirmation = '000000'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
        end
        it 'last_nameが空だと登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("名字を入力してください", "名字全角文字を使用してください")
        end
        it 'last_nameが全角（漢字、ひらがな、カタカナ）で入力されていないと登録できない' do
          @user.last_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('名字全角文字を使用してください')
        end
        it 'first_nameが空だと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("名前を入力してください", "名前全角文字を使用してください")
        end
        it 'first_nameが全角（漢字、ひらがな、カタカナ）で入力されていないと登録できない' do
          @user.first_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前全角文字を使用してください')
        end
        it 'last_name_kanaが空だと登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("名字カナを入力してください", "名字カナ全角カナを使用してください")
        end
        it 'last_name_kanaが全角（カタカナ）で入力されていないと登録できない' do
          @user.last_name_kana = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('名字カナ全角カナを使用してください')
        end
        it 'first_name_kanaが空だと登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("名前カナを入力してください", "名前カナ全角カナを使用してください")
        end
        it 'first_name_kanaが全角（カタカナ）で入力されていないと登録できない' do
          @user.first_name_kana = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前カナ全角カナを使用してください')
        end
        it 'phone_numberが空だと登録できない' do
          @user.phone_number = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("電話番号を入力してください", "電話番号ハイフンは必要ありません")
        end
      end
    end
  end
end