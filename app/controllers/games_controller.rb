class GamesController < ApplicationController
  def index
    @players_turn = session[:players_turn].to_i
    @player = session[:players][@players_turn]["name"]  
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
    reset_session

    session[:player_1] = params[:player_1]  
    session[:player_2] = params[:player_2]

    if session[:player_1] == ""
      session[:player_1] = "Player 1"
    end

    if session[:player_2] == ""
      session[:player_2] = "Player 2"
    end

    session[:players_turn] = params[:first].to_i

    @players = [player_1 = Player.new(name = session[:player_1], Dice.new(6,2)),
                player_2 = Player.new(name = session[:player_2], Dice.new(6,2))]

    session[:players] = @players

    redirect_to games_path
  end

  def rolldice
    @players_turn = session[:players_turn].to_i
    @player = session[:players][@players_turn]
    @player_dice = session[:players][@players_turn]["dice"]["dice_roll_possibilities"]
    @player_name = session[:players][@players_turn]["name"] 

    if Dice.rolls_left?(@player_dice)
      @roll = Dice.roll(@player_dice)
      session[:players][@players_turn]["dice"]["dice_roll_possibilities"] = @player_dice
    else
      @dice = Dice.new_dice_set(6,2)
      @roll = Dice.roll(@dice)
      session[:players][@players_turn]["dice"]["dice_roll_possibilities"] = @dice
           
    end

    if @players_turn == 0
      @players_turn += 1
    else
      @players_turn = 0
    end

    session[:players_turn] = @players_turn

    next_player = session[:players][@players_turn]["name"]
    next_player
  
    @html_content = render_to_string
    data = {:name => next_player, :html_content => @html_content} 

    respond_to do |format|
      format.json { render :json => data,  :status => :ok }
    end  
  end
end
