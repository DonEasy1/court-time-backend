class Api::V1::ClubsController < ApplicationController

# before_action :set_user

    def index
      @clubs = Club.all
      render json: @clubs
    end

    def show
      @club = Club.find(params[:id])

      render json: @club
    end


    def create
      @club = Club.new(club_params)
        if @club.save
          render json: @club
        else
          render json: {error: 'Error creating club'}
        end
    end


    def destroy
    end


    private

    def set_club
      @club = Club.find(params[:id])
    end

    def set_reservation
      @reservation = Reservation.find(params[:reservation_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def club_params
      params.require(:club).permit(:club_name, :location, :number_courts)
    end




end
