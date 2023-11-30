require "test_helper"

class WorkStepTest < ActiveSupport::TestCase
  describe "WorkStep" do
    let(:klazz) { WorkStep }

    let(:fixture_names) {
      %i[
        workstep1
        workstep2
        workstep3
      ]
    }

    it "has valid fixtures" do
      fixture_names.each do |fixture_name|
        subject = work_steps(fixture_name)
        subject.validate

        value(subject.errors).must_be_empty
      end
    end
  end
end
