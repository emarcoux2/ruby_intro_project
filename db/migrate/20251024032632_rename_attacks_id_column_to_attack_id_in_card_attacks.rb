class RenameAttacksIdColumnToAttackIdInCardAttacks < ActiveRecord::Migration[8.0]
  def change
    rename_column :card_attacks, :attacks_id, :attack_id
  end
end
