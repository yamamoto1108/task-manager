require 'rails_helper'

describe BoardsController do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:background) { create(:background) }

  describe 'GET #index' do
    context 'log in' do
      before do
        login_user user
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #show' do
    context 'log in' do
      before do
        login_user user
      end
      it "assigns the requested board to @board" do
        board = create(:board)
        get :show, params: {id: board}
        expect(assigns(:board)).to eq board
      end
      it "renders the :show template" do
        board = create(:board)
        get :show, params: {id: board}
        expect(response).to render_template :show
      end
    end

    context 'not log in' do
      before do
        board = create(:board)
        get :show, params: {id: board}
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'log in' do
      before do
        login_user user
      end
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      before do
        get :new
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    let(:params) { { background_id: background.id, user_id: user.id, team_id: team.id, board: attributes_for(:board) }}
    context 'log in' do
      before do
        login_user user
      end

      context 'can save' do
        subject {post :create, params: params}
        it 'count up board' do
          expect{subject}.to change(Board, :count).by(1)
        end
        it 'redirects to boards_path' do
          subject
          expect(response).to redirect_to(boards_path)
        end
      end

      context 'can not save' do
        let(:invalid_params) { { background_id: background.id, user_id: user.id, team_id: team.id, board: attributes_for(:board, name: nil) } }
        subject {post :create, params: invalid_params}
        it 'does not count up board' do
          expect{subject}.not_to change(Board, :count)
        end
        it 'renders the :new template' do
          subject
          expect(response).to render_template :new
        end
      end
    end

    context 'not log in' do
      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'log in' do
      before do
        login_user user
      end
      it "assigns the requested board to @board" do
        board = create(:board)
        get :edit, params: {id: board}
        expect(assigns(:board)).to eq board
      end
      it "renders the :edit template" do
        board = create(:board)
        get :edit, params: {id: board}
        expect(response).to render_template :edit
      end
    end

    context 'not log in' do
      before do
        board = create(:board)
        get :edit, params: {id: board}
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
