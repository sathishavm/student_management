require 'spec_helper'

RSpec.describe AssignmentsController, type: :controller do

  classes = TrainingClass.create(name: 'tests')
  let(:valid_attributes) { {training_class_id: classes.id, title: "test"}  }

  let(:invalid_attributes) {
    {training_class_ids: classes.id, titles: "test"}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all assignments as @assignments" do
      assignment = Assignment.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:assignments)).to eq([assignment])
    end
  end

  describe "GET #show" do
    it "assigns the requested assignment as @assignment" do
      assignment = Assignment.create! valid_attributes
      get :show, {:id => assignment.to_param}, valid_session
      expect(assigns(:assignment)).to eq(assignment)
    end
  end

  describe "GET #new" do
    it "assigns a new assignment as @assignment" do
      get :new, {}, valid_session
      expect(assigns(:assignment)).to be_a_new(Assignment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested assignment as @assignment" do
      assignment = Assignment.create! valid_attributes
      get :edit, {:id => assignment.to_param}, valid_session
      expect(assigns(:assignment)).to eq(assignment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Assignment" do
        expect {
          post :create, {:assignment => valid_attributes}, valid_session
        }.to change(Assignment, :count).by(1)
      end

      it "assigns a newly created assignment as @assignment" do
        post :create, {:assignment => valid_attributes}, valid_session
        expect(assigns(:assignment)).to be_a(Assignment)
        expect(assigns(:assignment)).to be_persisted
      end

      it "redirects to the created assignment" do
        post :create, {:assignment => valid_attributes}, valid_session
        expect(response).to redirect_to(Assignment.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved assignment as @assignment" do
        post :create, {:assignment => invalid_attributes}, valid_session
        expect(assigns(:assignment)).to be_a_new(Assignment)
      end

      it "re-renders the 'new' template" do
        post :create, {:assignment => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: "test new"}
      }

      it "updates the requested assignment" do
        assignment = Assignment.create! valid_attributes
        put :update, {:id => assignment.to_param, :assignment => new_attributes}, valid_session
        assignment.reload
      end

      it "assigns the requested assignment as @assignment" do
        assignment = Assignment.create! valid_attributes
        put :update, {:id => assignment.to_param, :assignment => valid_attributes}, valid_session
        expect(assigns(:assignment)).to eq(assignment)
      end

      it "redirects to the assignment" do
        assignment = Assignment.create! valid_attributes
        put :update, {:id => assignment.to_param, :assignment => valid_attributes}, valid_session
        expect(response).to redirect_to(assignment)
      end
    end

    context "with invalid params" do
      it "assigns the assignment as @assignment" do
        assignment = Assignment.create! valid_attributes
        put :update, {:id => assignment.to_param, :assignment => invalid_attributes}, valid_session
        expect(assigns(:assignment)).to eq(assignment)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested assignment" do
      assignment = Assignment.create! valid_attributes
      expect {
        delete :destroy, {:id => assignment.to_param}, valid_session
      }.to change(Assignment, :count).by(-1)
    end

    it "redirects to the assignments list" do
      assignment = Assignment.create! valid_attributes
      delete :destroy, {:id => assignment.to_param}, valid_session
      expect(response).to redirect_to(assignments_url)
    end
  end

end
