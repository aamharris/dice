class GamesController < ApplicationController
  def index
   @player = @@game.players[@@game.players_turn]    
  end

  def new
    @name_1 = session[:player_1]
    @name_2 = session[:player_2]

    if session[:player_1] == nil
      @goes_first_1 = "Player 1"
    else
      @goes_first_1 = @name_1
    end

    if session[:player_2] == nil
      @goes_first_2 = "Player 2"
    else
      @goes_first_2 = @name_2
    end

  end

  def create
    @@game = Game.new
    reset_session
    session[:player_1] = params[:player_1]  
    session[:player_2] = params[:player_2]
    @@game.players_turn = params[:first].to_i
    @@game.players[0].name = session[:player_1]
    @@game.players[1].name = session[:player_2]

    redirect_to games_path
  end

  def rolldice
    @player = @@game.players[@@game.players_turn]
    if @player.dice.rolls_left?
      @roll = @player.dice.roll
    else
      @player.dice = Dice.new(6, 2)
      rolldice
    end

    if @@game.players_turn == 0
      @@game.players_turn += 1
    else
      @@game.players_turn = 0
    end
    next_player = @@game.players[@@game.players_turn]

    @html_content = render_to_string
    data = {:name => next_player.name, :html_content => @html_content}
    view = 

    respond_to do |format|
      format.json { render :json => data,  :status => :ok }
    end
  
  end
end
