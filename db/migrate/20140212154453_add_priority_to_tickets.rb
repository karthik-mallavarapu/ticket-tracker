class AddPriorityToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :priority, :string
  end
end
