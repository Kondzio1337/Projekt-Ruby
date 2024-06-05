class Ofertum < ApplicationRecord
  validates :id_stanowiska , presence: true
  validates :id_branzy , presence: true
  validates :id_firmy , presence: true
  validates :tytul, presence: true,length: {minimum: 5}

  validates :rodzaj, presence: true
  has_one :branza
  has_one :firma
  has_one :stanowisko
  has_many :odpowiedzs, dependent: :destroy
end
