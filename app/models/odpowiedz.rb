class Odpowiedz < ApplicationRecord
  validates :nr_tel, presence: true,length: {minimum: 9}
  has_one :ofertum
end
