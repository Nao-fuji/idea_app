require 'rails_helper'

RSpec.describe IdeaPurchase, type: :model do
  describe 'create' do
    before do
      @idea_purchase = FactoryBot.build(:idea_purchase)
    end

    describe 'アイデアが購入できるとき' do
      it 'tokenが存在する時'do
        expect(@idea_purchase).to be_valid
      end
    end

    describe 'アイデアが購入できないとき'do
      it 'tokenが空のとき'do
        @idea_purchase.token = ''
        @idea_purchase.valid?
        expect(@idea_purchase.errors.full_messages).to include("クレジット情報を入力してください")
      end
    end
  end
end
