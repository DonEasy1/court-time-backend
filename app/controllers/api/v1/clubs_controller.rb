class Api::V1::ClubsController < ApplicationController

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
            resp = {
              error: @club.errors.full_messages.to_sentence
            }
        render json: resp
         end
     end

     def destroy
           @club = set_club

           @club.destroy
           render json: @club

      # else
      #   render json: {
      #     error: "You must be an admin to delete a club"
      #   }
      #   end
     end


     private

     def set_club
       @club = Club.find(params[:id])
     end

     def set_court
       @court = Court.find(params[:court_id])
     end

     def set_reservation
       @reservation = Reservation.find(params[:reservation_id])
     end

     def set_user
       @user = User.find(params[:user_id])
     end

     def club_params
       params.require(:club).permit(:club_name, :location)
     end


 end
