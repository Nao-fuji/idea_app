require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'create' do
    before do
      @tweet = FactoryBot.build(:tweet)
    end

    describe '募集に対しての投稿が可能なとき' do
      it 'idea, explainが存在する時' do
        expect(@tweet).to be_valid
      end
    end

    describe '募集に対しての投稿が不可のとき' do
      it 'ideaが空のとき' do
        @tweet.idea = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('アイデアを入力してください')
      end
      it 'explainが空のとき' do
        @tweet.explain = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('説明を入力してください')
      end
    end
  end
end
