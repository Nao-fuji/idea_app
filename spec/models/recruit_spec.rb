require 'rails_helper'

RSpec.describe Recruit, type: :model do
  describe 'create' do
    before do
      @recruit = FactoryBot.build(:recruit)
    end

    describe 'アイデアを募集可能なとき'do
      it 'theme,prece,category_idが全て存在する時'do
        expect(@recruit).to be_valid
      end
    end

    describe 'アイデアが募集不可のとき'do
      it 'themeが空のとき'do
        @recruit.theme = ''
        @recruit.valid?
        expect(@recruit.errors.full_messages).to include("Theme can't be blank")    
      end
      it 'priceが空のとき'do
        @recruit.price = ""
        @recruit.valid?
        expect(@recruit.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが選択されていないと出品できない' do
        @recruit.category_id = 1
        @recruit.valid?
        expect(@recruit.errors.full_messages).to include('Category must be other than 1')
      end
    end
  end
end
