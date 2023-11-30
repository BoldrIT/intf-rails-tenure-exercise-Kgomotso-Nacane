require "test_helper"

class CaseTest < ActiveSupport::TestCase
  describe "Case" do
    let(:klazz) { Case }

    let(:fixture_names) {
      %i[
        case1
        case2
      ]
    }

    it "has valid fixtures" do
      fixture_names.each do |fixture_name|
        subject = cases(fixture_name)
        subject.validate

        value(subject.errors).must_be_empty
      end
    end

    describe "#current_work_step" do
      describe "Given multiple work steps" do
        let(:case1) { cases(:case1) }
        let(:target_current_work_step) { work_steps(:workstep2) }

        subject { case1.current_work_step }

        it "returns the expected work step" do
          value(subject).must_equal(target_current_work_step)
        end
      end
    end

    describe "#previous_work_step" do
      describe "Given multiple work steps" do
        let(:case1) { cases(:case1) }
        let(:target_previous_work_step) { work_steps(:workstep1) }

        subject { case1.previous_work_step }

        it "returns the expected work step" do
          value(subject).must_equal(target_previous_work_step)
        end
      end
    end

    describe "#next_work_step" do
      describe "Given multiple work steps" do
        let(:case1) { cases(:case1) }
        let(:target_next_work_step) { work_steps(:workstep3) }

        subject { case1.next_work_step }

        it "returns the expected work step" do
          value(subject).must_equal(target_next_work_step)
        end
      end
    end

    describe "#these_work_steps" do
      let(:case1) { cases(:case1) }

      subject { case1.these_work_steps }

      it "returns WorkSteps" do
        value(subject).wont_be_empty

        result = subject.first
        value(result).must_be_instance_of(WorkStep)
      end
    end

    describe "#applicant_has_been_notified?" do
      describe "Given Case#applicant_was_notified_at = nil" do
        let(:case1) { cases(:case1) }

        subject { case1.applicant_has_been_notified? }

        it "returns false" do
          value(subject).must_equal(false)
        end
      end

      describe "Given Case#applicant_was_notified_at has a value" do
        let(:case1) {
          cases(:case1).tap do |the_case|
            the_case.applicant_was_notified_at = DateTime.now
          end
         }

        subject { case1.applicant_has_been_notified? }

        it "returns true" do
          value(subject).must_equal(true)
        end
      end
    end
  end
end
