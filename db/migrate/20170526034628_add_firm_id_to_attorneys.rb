class AddFirmIdToAttorneys < ActiveRecord::Migration[5.0]
  def change
  	add_reference :attorneys, :firm, index: true, foreign_key: true
  end
end
