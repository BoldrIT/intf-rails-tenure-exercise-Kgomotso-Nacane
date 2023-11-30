require "test_helper"

class WorkStepPanelTest < ActiveSupport::TestCase
  describe "WorkStepPanel" do
    let(:klazz) { WorkStepPanel }

    let(:fixture_names) {
      %i[
        workstep1_panel1
        workstep1_panel2
      ]
    }

    it "has valid fixtures" do
      fixture_names.each do |fixture_name|
        subject = work_step_panels(fixture_name)
        subject.validate

        value(subject.errors).must_be_empty
      end
    end
  end
end
