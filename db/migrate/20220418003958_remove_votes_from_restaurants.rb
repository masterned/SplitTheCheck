class RemoveVotesFromRestaurants < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :will_split_votes, :integer
    remove_column :restaurants, :will_not_split_votes, :integer
  end
end
