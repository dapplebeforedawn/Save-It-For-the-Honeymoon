require 'spec_helper'

describe DealsController do

  # This should return the minimal set of attributes required to create a valid
  # Deal. As you add validations to Deal, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { copy:'some copy', copy_header:'some copy header', copy_subheader:'some copy subheader'}
  end

  describe "GET index" do
    it "assigns all deals as @deals" do
      deal = Deal.create! valid_attributes
      deal_two = Deal.create! valid_attributes
      get :index
      assigns(:deals).should eq([deal, deal_two])
    end
  end

  describe "GET show" do
    it "assigns the requested deal as @deal" do
      deal = Deal.create! valid_attributes
      get :show, :id => deal.id.to_s
      assigns(:deal).should eq(deal)
    end
  end

  describe "GET new" do
    it "assigns a new deal as @deal" do
      get :new
      assigns(:deal).should be_a_new(Deal)
    end
  end

  describe "GET edit" do
    it "assigns the requested deal as @deal" do
      deal = Deal.create! valid_attributes
      get :edit, :id => deal.id.to_s
      assigns(:deal).should eq(deal)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Deal" do
        expect {
          post :create, :deal => valid_attributes
        }.to change(Deal, :count).by(1)
      end

      it "assigns a newly created deal as @deal" do
        post :create, :deal => valid_attributes
        assigns(:deal).should be_a(Deal)
        assigns(:deal).should be_persisted
      end

      it "redirects to the created deal" do
        post :create, :deal => valid_attributes
        response.should redirect_to(Deal.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved deal as @deal" do
        # Trigger the behavior that occurs when invalid params are submitted
        Deal.any_instance.stub(:save).and_return(false)
        post :create, :deal => {}
        assigns(:deal).should be_a_new(Deal)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Deal.any_instance.stub(:save).and_return(false)
        post :create, :deal => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested deal" do
        deal = Deal.create! valid_attributes
        # Assuming there are no other deals in the database, this
        # specifies that the Deal created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Deal.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => deal.id, :deal => {'these' => 'params'}
      end

      it "assigns the requested deal as @deal" do
        deal = Deal.create! valid_attributes
        put :update, :id => deal.id, :deal => valid_attributes
        assigns(:deal).should eq(deal)
      end

      it "redirects to the deal" do
        deal = Deal.create! valid_attributes
        put :update, :id => deal.id, :deal => valid_attributes
        response.should redirect_to(deal)
      end
    end

    describe "with invalid params" do
      it "assigns the deal as @deal" do
        deal = Deal.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Deal.any_instance.stub(:save).and_return(false)
        put :update, :id => deal.id.to_s, :deal => {}
        assigns(:deal).should eq(deal)
      end

      it "re-renders the 'edit' template" do
        deal = Deal.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Deal.any_instance.stub(:save).and_return(false)
        put :update, :id => deal.id.to_s, :deal => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested deal" do
      deal = Deal.create! valid_attributes
      expect {
        delete :destroy, :id => deal.id.to_s
      }.to change(Deal, :count).by(-1)
    end

    it "redirects to the deals list" do
      deal = Deal.create! valid_attributes
      delete :destroy, :id => deal.id.to_s
      response.should redirect_to(deals_url)
    end
  end

end
