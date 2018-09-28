require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET #index' do
    it 'loads index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #new' do
    before do
      sign_in @user
    end
    it 'redirects to login when not logged in' do
      get :new,
      expect(response).to be_ok
    end
  end

  context 'GET #edit' do
    it 'shows login page' do
      get :edit, params: {id: @product.id}
      expect(response).to redirect_to new_user_session_path
    end
  end

  context "POST #create" do
    before do
      sign_in @user
    end

    it "creates new product" do
      @product = FactoryBot.create(:product)
      expect(response).to be_successful
    end
    it "throws error creating a product" do
       expect(Product.new(price:'string', description: '')).not_to be_valid
    end
  end

  describe "PATCH #update" do
    context "with good data" do
      before do
        sign_in @user
      end
      it "updates product and redirects" do
        patch :update, id: @product.id, product: { name: "berlinracerbike",  price: "5", description: 'fantastic'}
        expect(response).to be_redirect
      end
    end

    context 'DELETE' do
      before do
        sign_in @user
      end

      it 'can delete product' do
        delete :destroy, params: { id: @product.id }
        expect(response).to redirect_to products_url
      end
    end

  end
end
