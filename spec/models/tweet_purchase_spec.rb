require 'rails_helper'

RSpec.describe TweetPurchase, type: :model do
  describe 'create' do
    before do
      @tweet_purchase = FactoryBot.build(:tweet_purchase)
    end

    describe '募集に対するアイデアが購入できるとき'do
      it 'token, priceが存在する時'do
        expect(@tweet_purchase).to be_valid
      end
    end

    describe '募集に対するアイデアが購入できないとき'do
      it 'tokenが空のとき'do
        @tweet_purchase.token =""
        @tweet_purchase.valid?
        expect(@tweet_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'priceが空のとき'do
        @tweet_purchase.price =""
        @tweet_purchase.valid?
        expect(@tweet_purchase.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥50未満の時出品できない' do
        @tweet_purchase.price = '49'
        @tweet_purchase.valid?
        expect(@tweet_purchase.errors.full_messages).to include('Price の範囲は¥50~¥10000の間で設定してください')
      end
      it 'priceが¥10000を超える時出品できない' do
        @tweet_purchase.price = '10001'
        @tweet_purchase.valid?
        expect(@tweet_purchase.errors.full_messages).to include('Price の範囲は¥50~¥10000の間で設定してください')
      end
    end
  end
end
