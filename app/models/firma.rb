class Firma < ApplicationRecord
  validates :nazwa, presence: true,length: {minimum: 5}
  has_many :ofertums, dependent: :destroy
end
