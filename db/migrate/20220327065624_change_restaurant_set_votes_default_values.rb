class ChangeRestaurantSetVotesDefaultValues < ActiveRecord::Migration[6.1]
  def change
    change_column_default :restaurants, :will_split_votes, from: nil, to: 0
    change_column_default :restaurants, :will_not_split_votes, from: nil, to: 0
  end
end
