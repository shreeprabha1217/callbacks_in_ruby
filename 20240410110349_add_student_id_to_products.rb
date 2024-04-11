class AddStudentIdToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :student,foreign_key: true
  end
end
