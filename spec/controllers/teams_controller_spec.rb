require 'rails_helper'

describe TeamsController do
  let(:user) { create(:user) }
  let(:team) { create(:team) }

  describe 'GET #show' do
    context 'log in' do
      before do
        login_user user
      end
      it "assigns the requested team to @team" do
        team = create(:team)
        get :show, params: {id: team}
        expect(assigns(:team)).to eq team
      end
      it "renders the :show template" do
        team = create(:team)
        get :show, params: {id: team}
        expect(response).to render_template :show
      end
    end

    context 'not log in' do
      before do
        team = create(:team)
        get :show, params: {id: team}
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
    let(:params) { {team: attributes_for(:team) }}
    context 'log in' do
      before do
        login_user user
      end

      context 'can save' do
        subject {post :create, params: params}
        it 'count up team' do
          expect{subject}.to change(Team, :count).by(1)
        end
        it 'redirects to team_path' do
          subject
          expect(response).to redirect_to(team_path(team.id))
        end
      end

      context 'can not save' do
        let(:invalid_params) { { user_id: user.id, team: attributes_for(:team, name: nil) } }
        subject {post :create, params: invalid_params}
        it 'does not count up team' do
          expect{subject}.not_to change(Team, :count)
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
      it "assigns the requested team to @team" do
        team = create(:team)
        get :edit, params: {id: team}
        expect(assigns(:team)).to eq team
      end
      it "renders the :edit template" do
        team = create(:team, user_ids: user.id)
        get :edit, params: {id: team}
        expect(response).to render_template :edit
      end
    end

    context 'not log in' do
      before do
        team = create(:team)
        get :edit, params: {id: team}
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH #update' do
    let(:update_attributes) do
      { name: 'update_team', about: 'update_teamです'}
    end
    context 'log in' do
      before do
        login_user user
      end
      it "assigns the requested team to @team" do
        team = create(:team)
        patch :update, params: {id: team.id}
        expect(assigns(:team)).to eq team
      end
      it "updates @team's attributes" do
        patch :update, params: {id: team.id, team: update_attributes}, session: {}
        team.reload
        expect(team.name).to eq update_attributes[:name]
        expect(team.about).to eq update_attributes[:about]
      end
      it "redirects to team_path" do
        patch :update, params: {id: team.id, team: update_attributes}, session: {}
        team = Team.last
        expect(response).to redirect_to(team_path(team))
      end
    end

    context 'not log in' do
      it 'redirects to new_user_session_path' do
        patch :update, params: {id: team.id, team: update_attributes}, session: {}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
