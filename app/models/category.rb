class Category < ActiveHash::Base

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '女の子のお洋服' },
    { id: 3, name: '男の子のお洋服' },
    { id: 4, name: 'おもちゃ' },
    { id: 5, name: '家具' },
    { id: 6, name: '食器' },
    { id: 7, name: 'チャイルドシート' },
    { id: 8, name: 'ベビーカー' },
    { id: 9, name: '本' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items

end