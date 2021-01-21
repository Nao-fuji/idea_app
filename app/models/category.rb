class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ビジネス' },
    { id: 3, name: '教育' },
    { id: 4, name: 'エンターテインメント' },
    { id: 5, name: '財務' },
    { id: 6, name: 'ヘルスケア' },
    { id: 7, name: '写真/動画' },
    { id: 8, name: '仕事効率化' },
    { id: 9, name: 'ソーシャルネットワーキング' },
    { id: 10, name: '旅行' },
    { id: 11, name: 'グッズ' },
    { id: 12, name: 'メディカル' },
    { id: 13, name: 'フード/ドリンク' },
    { id: 14, name: 'その他' }
  ]

  def self.search(search)
    if search != ''
      Category.where(id: 2)
    else
      Idea.all
    end
  end
end
