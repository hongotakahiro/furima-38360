class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー' },
    { id: 5, name: 'キッズ' },
    { id: 6, name: 'インテリア' },
    { id: 7, name: '住まい' },
    { id: 8, name: '小物' },
    { id: 9, name: '本' },
    { id: 10, name: '音楽' },
    { id: 11, name: 'ゲーム' },
    { id: 12, name: 'おもちゃ' },
    { id: 13, name: 'ホビー' },
    { id: 14, name: 'ホビー' },
    { id: 15, name: 'グッズ' },
    { id: 16, name: '家電' },
    { id: 17, name: 'スマホ' },
    { id: 18, name: 'カメラ' },
    { id: 19, name: 'スポーツ' },
    { id: 20, name: 'レジャー' },
    { id: 21, name: 'ハンドメイド' },
    { id: 22, name: 'その他' }

  ]

  include ActiveHash::Associations
  has_many :items
end
