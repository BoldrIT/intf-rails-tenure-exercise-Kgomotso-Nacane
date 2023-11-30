class PanelRecusal < ApplicationRecord
  belongs_to :panel_member
  belongs_to :case
end
