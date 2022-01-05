class CreateDivisionsEmployeesProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :divisions do |t|
      t.string :name
      t.timestamp
    end

    create_table :employees do |t|
      t.string :name
      t.integer :division_id

      t.timestamp
    end
    
    create_table :projects do |t|
      t.string :name
      t.timestamp
    end
  end
end
