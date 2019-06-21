class TeamsController < ApplicationController
  before_action :set_team, except: :new

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:name, :about, :image)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
