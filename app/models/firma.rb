class Firma < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :nazwa, presence: true,length: {minimum: 5}
  has_many :ofertums, dependent: :destroy
end
