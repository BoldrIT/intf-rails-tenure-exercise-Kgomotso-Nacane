class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include RequestStore

  def self.current_user
    RequestStore.store[:current_user]
  end

  def current_user
    self.class.current_user
  end
end
