require 'rails_helper'

RSpec.describe Identification, type: :model do
  describe 'create' do
    before do
      @identification = FactoryBot.build(:identification)
    end

    describe 'ユーザー新規登録' do
      context '新規登録が上手くいく時' do
        it 'last_name, first_name, last_name_kana, first_name_kana, phone_numberが存在する時' do
          expect(@identification).to be_valid
        end
      end

      context '新規登録が上手くいかない時' do
        it 'last_nameが空だと登録できない' do
          @identification.last_name = ''
          @identification.valid?
          expect(@identification.errors.full_messages).to include('名字を入力してください', '名字全角文字を使用してください')
        end
        it 'last_nameが全角（漢字、ひらがな、カタカナ）で入力されていないと登録できない' do
          @identification.last_name = 'abc'
          @identification.valid?
          expect(@identification.errors.full_messages).to include('名字全角文字を使用してください')
        end
        it 'first_nameが空だと登録できない' do
          @identification.first_name = ''
          @identification.valid?
          expect(@identification.errors.full_messages).to include('名前を入力してください', '名前全角文字を使用してください')
        end
        it 'first_nameが全角（漢字、ひらがな、カタカナ）で入力されていないと登録できない' do
          @identification.first_name = 'abc'
          @identification.valid?
          expect(@identification.errors.full_messages).to include('名前全角文字を使用してください')
        end
        it 'last_name_kanaが空だと登録できない' do
          @identification.last_name_kana = ''
          @identification.valid?
          expect(@identification.errors.full_messages).to include('名字カナを入力してください', '名字カナ全角カナを使用してください')
        end
        it 'last_name_kanaが全角（カタカナ）で入力されていないと登録できない' do
          @identification.last_name_kana = 'abc'
          @identification.valid?
          expect(@identification.errors.full_messages).to include('名字カナ全角カナを使用してください')
        end
        it 'first_name_kanaが空だと登録できない' do
          @identification.first_name_kana = ''
          @identification.valid?
          expect(@identification.errors.full_messages).to include('名前カナを入力してください', '名前カナ全角カナを使用してください')
        end
        it 'first_name_kanaが全角（カタカナ）で入力されていないと登録できない' do
          @identification.first_name_kana = 'abc'
          @identification.valid?
          expect(@identification.errors.full_messages).to include('名前カナ全角カナを使用してください')
        end
        it 'phone_numberが空だと登録できない' do
          @identification.phone_number = ''
          @identification.valid?
          expect(@identification.errors.full_messages).to include('電話番号を入力してください', '電話番号ハイフンは必要ありません')
        end
      end
    end
  end
end
