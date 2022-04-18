class VotesController < ApplicationController
  # POST /votes or /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to restaurants_url, notice: "Voting was successful. Thank you for voting!" }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render restaurants_url, notice: "Something went wrong." }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def vote_params
      params.permit(:user_id, :restaurant_id, :will_split?)
    end
end
