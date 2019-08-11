class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, except: [:new, :create]
  before_action :correct_team_user,  except: [:show, :new, :create]

  def show
  end

  def new
    @team = Team.new
    @team.users << current_user
    @users = @team.users.where.not(id: current_user.id)
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_path(@team), notice: "チームを作成しました。"
    else
      render :new
    end
  end

  def edit
    @users = @team.users.where.not(id: current_user.id)
  end

  def update
    if @team.update(team_params)
      redirect_to team_path(@team), notice: "チームを更新しました。"
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:name, :about, :image, user_ids: [])
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def correct_team_user
    redirect_to boards_path unless @team.users.include?(current_user)
  end
end
