class AddApplicantWasNotifiedAtToCase < ActiveRecord::Migration[6.1]
  def change
    add_column(:cases, :applicant_was_notified_at, :datetime)
  end
end
