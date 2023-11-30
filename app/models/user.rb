class User < ApplicationRecord
  validates :unique_identifier, uniqueness: true

  has_many :panel_members, dependent: :destroy
  belongs_to :institution
end
