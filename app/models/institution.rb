class Institution < ApplicationRecord
  has_many :cases, dependent: :destroy
  has_many :users, dependent: :destroy
end
