require 'rails_helper'

describe UsersController do
  shared_examples 'admin access to users' do
    describe 'GET #index' do
      it "populates an array of all users" do
        tim = create(:user, name: 'tim cook')
        steve = create(:user, name: 'steve jobs', email: "steve@apple.com")
        get :index
        expect(assigns(:users)).to include(tim, steve)
      end
    end
    describe 'DELETE #destroy' do
      before :each do
        @user = create(:user)
      end

      it "deletes the user from the database" do
        expect{
          delete :destroy, id: @user
        }.to change(User, :count).by(-1)
      end

      it "redirects to user#index" do
        delete :destroy, id: @user
        expect(response).to redirect_to users_url
      end
    end

  end

  shared_examples 'correct user access to users' do

    describe 'GET #show' do
      it "assigns the requested user to @user" do
        user = create(:user)
        get :show, id: user
        expect(assigns(:user)).to eq user
      end
    end
      describe 'GET #edit' do
        before :each do
          @user = create(:user)
        end
        it "assigns the requested user to @user" do
          get :edit, id: @user
          expect(assigns(:user)).to eq @user
        end

        it "render the :edit template" do
          get :edit, id: @user
          expect(assigns(:user)).to render_template :edit
        end
    end

    describe 'PATCH #update' do
      before :each do
        @user = create(:user, name: "steve jobs", email: "steve@apple.com")
      end
      context "with valid attributes" do

        it "locates the requested @user" do
          patch :update, id: @user, user: attributes_for(:user)
          expect(assigns(:user)).to eq @user
        end

        it "change @user's attributes " do
          patch :update, id: @user, user: attributes_for(:user,
          name: "Larry Page",
          email: "larry@google.com")
          @user.reload
          expect(@user.name).to eq("Larry Page")
          expect(@user.email).to eq("larry@google.com")
        end

        it "renders to the user" do
          patch :update, id: @user, user: attributes_for(:user)
          expect(response).to redirect_to @user
        end
      end

      context "with invalid attributes" do
        it "does not update the user in the database" do
          patch :update, id: @user, user: attributes_for(:user,
          name: "Larry Page",
          email: nil)
          @user.reload
          expect(@user.name).not_to eq("Larry Page")
          expect(@user.email).to eq("steve@apple.com")
        end

        it "re-render the :edit template" do
          patch :update, id: @user, user: attributes_for(:user,
          name: nil)
          expect(response).to render_template :edit
        end
      end
    end
  end

  shared_examples 'guest access to users' do
    describe 'GET #new' do
      it "assigns a new User to @contact" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it "saves the new user in the database" do
          expect{
          post :create, user: attributes_for(:user)
          }.to change(User, :count).by(1)
        end

        it "redirects to users#show" do
          post :create, user: attributes_for(:user)
          expect(response).to redirect_to user_path(assigns(:user))
        end
      end

      context 'with invalid attributes' do
        it "doesn't save the new user int the database" do
          expect{
          post :create, user: attributes_for(:invalid_user)
          }.not_to change(User, :count)
        end

        it "re-renders the :new template" do
          post :create, user: attributes_for(:invalid_user)
          expect(response).to render_template :new
        end
      end
    end
  end

  describe 'admin access' do
    before :each do
      set_user_session(create(:admin))
    end
    it_behaves_like 'admin access to users'
    it_behaves_like 'correct user access to users'
  end

  describe 'user access' do
    before :each do
      set_user_session(create(:user, email: 'aaa@gmail.com'))
    end
    it_behaves_like 'correct user access to users'
  end

  describe 'guest access' do
    it_behaves_like 'guest access to users'
    describe 'GET #index' do
      it "redirects root_url" do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    describe 'GET #show' do
      it "requires login" do
        user = create(:user)
        get :show, id: user
        expect(response).to redirect_to login_url
      end
    end

    describe 'GET #edit' do
      it "redirects root_url" do
        user = create(:user)
        get :edit, id: user
        expect(response).to redirect_to root_url
      end
    end


    describe 'PUT #update' do
      it "redirects root_url" do
        put :update, id: create(:user),
        user: attributes_for(:user)
        expect(response).to redirect_to root_url
      end
    end

    describe 'DELETE #destroy' do
      it "redirects root_url" do
        delete :destroy, id: create(:user)
        expect(response).to redirect_to root_url
      end
    end
  end
end
