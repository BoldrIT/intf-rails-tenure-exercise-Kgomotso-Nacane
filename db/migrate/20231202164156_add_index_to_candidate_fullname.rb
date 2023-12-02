class AddIndexToCandidateFullname < ActiveRecord::Migration[6.1]
  def change
    add_index :cases, :candidate_fullname
  end
end
