class ItemsStatus < ActiveHash::Base

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '未使用' },
    { id: 3, name: '１、２回使用' },
    { id: 4, name: '傷あり・欠けあり・破れあり' },
  ]

  include ActiveHash::Associations
  has_many :items

end