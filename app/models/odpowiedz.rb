class Odpowiedz < ApplicationRecord
  validates :nr_tel, presence: true,length: {minimum: 9}
  validates :email, presence: true,format: { with: URI::MailTo::EMAIL_REGEXP }
  has_one :ofertum
end
