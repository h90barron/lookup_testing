require 'rails_helper'

RSpec.describe CopiersController, type: :controller do
  
  describe "GET #new" do
    context "when logged in as admin" do
      
      it "returns http success" do
        create_session
        get :new
        expect(response).to have_http_status(:success)
      end
    
      it "renders the new template if admin logged in" do
        # user = FactoryGirl.build :user, { name: "Hunter Barron", email: "h90@barron.com", password: "foobar" }
        # user.save
        # login user
        create_session
        get :new
        expect(response).to render_template(:new)
      end
    end
    
    #admin not logged in
    
  end
  
  describe "GET #index" do
    it "responds with http success code" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "returns the correct search result for name search" do
      @xerox = FactoryGirl.build :copier, { name: "Xerox", oem: "Xerox" }
      @xerox.save
      get :index, q: { name_or_oem_cont: "xerox" }
      expect(assigns(:copier).first).to eql @xerox
    end
    
    it "checks oem if search param not in name" do
      @canon = FactoryGirl.build :copier, { name: "SuperStar", oem: "Canon" }
      @canon.save
      get :index, q: { name_or_oem_cont: "canon" }
      expect(assigns(:copier).first).to eql @canon
    end
    
    it "returns correct number for queries with multiple results" do
      5.times do |i|
        copier = FactoryGirl.build :copier, { name: "Toshiba" + i.to_s, oem: "Toshiba" }
        copier.save
      end
      get :index, q: { name_or_oem_cont: "Toshiba" }
      expect(assigns(:copier).count).to eql 5
    end
      
  end
    
  describe "GET #show" do
    
    it "should with http success code" do
      create_copier
      get :show, id: "1"
      expect(response).to have_http_status(:success)
    end
    
    it "should set the value for copier instance variable" do
      create_copier
      get :show, id: "1"
      expect(assigns(:copier)).to eql Copier.find_by(id: 1)
    end
    
    it "should render show template" do
      create_copier
      get :show, id: "1"
      expect(response).to render_template(:show)
    end
  end
  
  describe "POST #create" do
    
    context "admin is logged in" do
      
      it "should create new copier when params are correct" do
        create_session
        post :create, copier: { name: "Xerox", oem: "Xerox", papercut: true, coinop: true, card_reader: true }
        expect(Copier.count).to eql 1
        copier = Copier.first
        expect(copier.name).to eql "Xerox"
      end
      
      it "should not allow non-permitted params" do
        create_session
        post :create, copier: { name: "Xerox bypass fake params", oem: "Xerox", fake_params: "fake param" }
        expect(Copier.count).to eql 1
        copier = Copier.first
        expect(copier.name).to eql "Xerox bypass fake params"
        expect(copier.oem).to eql "Xerox"
        expect(copier.has_attribute?(:fake_params)).to eql false
      end
      
      it "should not allow a duplicate copier to be created" do
        create_copier 
        create_session
        post :create, copier: { name: "Factory Xerox", oem: "Xerox" }
        expect(Copier.count).to eql 1
      end
      
    end
    
    context "when admin is not logged in" do
      
      it "should respond with 302 status code" do
        post :create, copier: { name: "Xerox" }
        expect(response).to have_http_status(:redirect)
      end
    
    end
    
  end
  
  describe "GET #edit" do
    context "when admin is logged in" do
      it "should respond with http status success" do
        create_session
        create_copier
        copier = Copier.first
        get :edit, id: copier.id
        expect(response).to have_http_status(:success)
      end
      
      it "should render the edit template" do
        create_session
        create_copier
        copier = Copier.first
        get :edit, id:  copier.id
        expect(response).to render_template(:edit)
      end
    end
    
    context "when admin is not logged in" do
      it "should respond with 302 status code" do
        create_copier
        copier = Copier.first
        get :edit, id: copier.id
        expect(response).to have_http_status(:redirect)
      end
    end
  end
  
  describe "PUT/PATCH #update" do
    context "when admin is logged in" do
      it "should update copier record" do
        create_session
        create_copier
        copier = Copier.first
        patch :update, id: copier.id, copier: { name: "Updated name" } 
        #expect(Copier.count).to eql 10
        expect(Copier.first.name).to eql "Updated name"
      end
  end
      
      
  end
  
  describe "DELETE #destroy" do
  end

end
