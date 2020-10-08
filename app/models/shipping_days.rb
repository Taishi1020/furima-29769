class ShippingDays < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1日〜2日で発送' },
    { id: 3, name: '２日〜３日で発送' },
    { id: 4, name: '4日〜7日で発送' }
  ]
end
