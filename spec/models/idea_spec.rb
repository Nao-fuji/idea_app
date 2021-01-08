require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'create' do
    before do
      @idea = FactoryBot.build(:idea)
    end

    describe 'アイデア投稿機能'do
      context 'アイデアが投稿可能のとき'do 
        it 'title,idea,price,category_idが存在する時' do
          expect(@idea).to be_valid
        end
      end

      context 'アイデアが投稿不可のとき'do
        it 'titleが空だと投稿できない'do
          @idea.title = ''
          @idea.valid?
          expect(@idea.errors.full_messages).to include("Title can't be blank")
        end
        it 'titleが8文字以上のとき' do
          @idea.title = 'abcdefghi'
          @idea.valid?
          expect(@idea.errors.full_messages).to include("Title is too long (maximum is 8 characters)")
        end
        it 'ideaが空のとき'do
          @idea.idea = ''
          @idea.valid?
          expect(@idea.errors.full_messages).to include("Idea can't be blank")
        end
        it 'priceが空だと出品できない' do
          @idea.price = ''
          @idea.valid?
          expect(@idea.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが¥50未満の時出品できない' do
          @idea.price = '49'
          @idea.valid?
          expect(@idea.errors.full_messages).to include('Price の範囲は¥50~¥500の間で設定してください')
        end
        it 'priceが¥500を超える時出品できない' do
          @idea.price = '501'
          @idea.valid?
          expect(@idea.errors.full_messages).to include('Price の範囲は¥50~¥500の間で設定してください')
        end
        it 'category_idが選択されていないと出品できない' do
          @idea.category_id = 1
          @idea.valid?
          expect(@idea.errors.full_messages).to include('Category must be other than 1')
        end
      end
    end
  end
end