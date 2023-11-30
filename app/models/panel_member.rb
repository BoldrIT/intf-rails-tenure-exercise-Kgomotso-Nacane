class PanelMember < ApplicationRecord
  belongs_to :panel
  belongs_to :user

  has_many :panel_recusals, dependent: :destroy
end
