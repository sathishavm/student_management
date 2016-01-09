require 'spec_helper'

RSpec.describe TrainingClassesController, type: :controller do

  let(:valid_attributes) {
    {name: 'test'}
  }

  let(:invalid_attributes) {
    {name_new: "test"}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all training_classes as @training_classes" do
      training_class = TrainingClass.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:training_classes)).to eq([training_class])
    end
  end

  describe "GET #show" do
    it "assigns the requested training_class as @training_class" do
      training_class = TrainingClass.create! valid_attributes
      get :show, {:id => training_class.to_param}, valid_session
      expect(assigns(:training_class)).to eq(training_class)
    end
  end

  describe "GET #new" do
    it "assigns a new training_class as @training_class" do
      get :new, {}, valid_session
      expect(assigns(:training_class)).to be_a_new(TrainingClass)
    end
  end

  describe "GET #edit" do
    it "assigns the requested training_class as @training_class" do
      training_class = TrainingClass.create! valid_attributes
      get :edit, {:id => training_class.to_param}, valid_session
      expect(assigns(:training_class)).to eq(training_class)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new TrainingClass" do
        expect {
          post :create, {:training_class => valid_attributes}, valid_session
        }.to change(TrainingClass, :count).by(1)
      end

      it "assigns a newly created training_class as @training_class" do
        post :create, {:training_class => valid_attributes}, valid_session
        expect(assigns(:training_class)).to be_a(TrainingClass)
        expect(assigns(:training_class)).to be_persisted
      end

      it "redirects to the created training_class" do
        post :create, {:training_class => valid_attributes}, valid_session
        expect(response).to redirect_to(TrainingClass.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved training_class as @training_class" do
        post :create, {:training_class => invalid_attributes}, valid_session
        expect(assigns(:training_class)).to be_a_new(TrainingClass)
      end

      it "re-renders the 'new' template" do
        post :create, {:training_class => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'tesss'}
      }

      it "updates the requested training_class" do
        training_class = TrainingClass.create! valid_attributes
        put :update, {:id => training_class.to_param, :training_class => new_attributes}, valid_session
        training_class.reload
      end

      it "assigns the requested training_class as @training_class" do
        training_class = TrainingClass.create! valid_attributes
        put :update, {:id => training_class.to_param, :training_class => valid_attributes}, valid_session
        expect(assigns(:training_class)).to eq(training_class)
      end

      it "redirects to the training_class" do
        training_class = TrainingClass.create! valid_attributes
        put :update, {:id => training_class.to_param, :training_class => valid_attributes}, valid_session
        expect(response).to redirect_to(training_class)
      end
    end

    context "with invalid params" do
      it "assigns the training_class as @training_class" do
        training_class = TrainingClass.create! valid_attributes
        put :update, {:id => training_class.to_param, :training_class => invalid_attributes}, valid_session
        expect(assigns(:training_class)).to eq(training_class)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested training_class" do
      training_class = TrainingClass.create! valid_attributes
      expect {
        delete :destroy, {:id => training_class.to_param}, valid_session
      }.to change(TrainingClass, :count).by(-1)
    end

    it "redirects to the training_classes list" do
      training_class = TrainingClass.create! valid_attributes
      delete :destroy, {:id => training_class.to_param}, valid_session
      expect(response).to redirect_to(training_classes_url)
    end
  end

end
