require "active_record_spec_helper"
require_relative "../../app/models/concerns/sizeable.rb"
require_relative "../../app/models/project.rb"
require_relative "../../app/models/task.rb"
require_relative "../support/size_matcher.rb"
require_relative "../shared/size_group.rb"

RSpec.describe Project do

  it_should_behave_like "sizeable"

  describe "completion" do
    ## START: with_basic_factories
    describe "without a task" do
      let(:project) { FactoryBot.build_stubbed(:project) }
      it "considers a project with no tasks to be done" do
        expect(project).to be_done
      end

      it "properly estimates a blank project" do
        expect(project.completed_velocity).to eq(0)
        expect(project.current_rate).to eq(0)
        expect(project.projected_days_remaining).to be_nan
        expect(project).not_to be_on_schedule
      end
    end

    describe "with a task" do
      let(:project) { FactoryBot.build_stubbed(:project, tasks: [task]) }
      let(:task) { FactoryBot.build_stubbed(:task) }

      it "knows that a project with an incomplete task is not done" do
        expect(project).not_to be_done
      end

      it "marks a project done if its tasks are done" do
        task.mark_completed
        expect(project).to be_done
      end
    end
    ## END: with_basic_factories
  end

  ## START: with_key_factories
  describe "estimates" do
    let(:project) { FactoryBot.build_stubbed(:project,
      tasks: [newly_done, old_done, small_not_done, large_not_done]) }
    let(:newly_done) { FactoryBot.build_stubbed(:task, :newly_complete) }
    let(:old_done) { FactoryBot.build_stubbed(
      :task, :long_complete, :small) }
    let(:small_not_done) { FactoryBot.build_stubbed(:task, :small) }
    let(:large_not_done) { FactoryBot.build_stubbed(:task, :large) }

    it "can calculate total size" do
      expect(project).to be_of_size(10)
      expect(project).not_to be_of_size(5)
    end

    it "can calculate remaining size" do
      expect(project).to be_of_size(6).for_incomplete_tasks_only
    end
    ## END: with_key_factories

    it "knows its velocity" do
      expect(project.completed_velocity).to eq(3)
    end

    it "knows its rate" do
      expect(project.current_rate).to eq(1.0 / 7)
    end

    it "knows its projected time remaining" do
      expect(project.projected_days_remaining).to eq(42)
    end

    it "knows if it is not on schedule" do
      project.due_date = 1.week.from_now
      expect(project).not_to be_on_schedule
    end

    it "knows if it is on schedule" do
      project.due_date = 6.months.from_now
      expect(project).to be_on_schedule
    end
  end

  ## START: test_order
  describe "task order" do
    let(:project) { create(:project, name: "Project") }

    it "makes 1 the order of the first task in an entry project" do
      expect(project.next_task_order).to eq(1)
    end

    it "gives me the order of the next task as one more than the most" do
      project.tasks.create(project_order: 3)
      project.tasks.create(project_order: 2)
      expect(project.next_task_order).to eq(4)
    end
  end
  ## END: test_order

  describe "stubs" do
    ## START: stub_one
    it "stubs an object" do
      project = Project.new(name: "Project Greenlight")
      allow(project).to receive(:name) # <label id="code.stub_one_stub" />
      expect(project.name).to be_nil # <label id="code.stub_one_assert" />
    end
    ## END: stub_one

    ## START: stub_two
    it "stubs an object again" do
      project = Project.new(name: "Project Greenlight")
      allow(project).to receive(:name).and_return("Fred")
      expect(project.name).to eq("Fred")
    end
    ## END: stub_two

    ## START: stub_class
    it "stubs the class" do
      allow(Project).to receive(:find).and_return(
        Project.new(name: "Project Greenlight"))
      project = Project.find(1) # <label id="code.stub_class_stub" />
      expect(project.name).to eq("Project Greenlight")
    end
    ## END: stub_class

    ## START: mock_one
    it "mocks an object" do
      mock_project = Project.new(name: "Project Greenlight")
      expect(mock_project).to receive(:name).and_return("Fred")
      expect(mock_project.name).to eq("Fred")
    end
    ## END: mock_one

  end

end
