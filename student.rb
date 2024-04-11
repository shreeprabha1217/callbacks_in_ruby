class ObjectDestroyer
  def after_destroy(a)
    puts "Object is deleted"
  end
end

class Student < ApplicationRecord
    validates :name, presence: true
    has_many :products, dependent: :destroy, before_add: :number_of_student
    #belongs_to :product
    after_validation :ensure_name
    before_create { puts "Provide student details" }
    after_destroy ObjectDestroyer.new
    #after_commit { puts "Successful" }
    after_update_commit { puts "Successfull" }
    before_save:normalizing_name,unless: :age_validate?,if: :grade_validate?
    #config.active_record.run_after_transaction_callbacks_in_order_defined = false

    def age_validate?
      age<18
    end
    def grade_validate?
      grade!="C"
    end
    @@count=0
    private
    def normalizing_name
      self.name=name.gsub(/[ -]/, '')
    end
    def number_of_student(student)
        if @@count>3
            puts "Not possible"
        else
            @@count+=1
        end
    end
        
    def ensure_name
      if name.blank?
        puts "Provide name"
      else
        puts "Registered"
      end
    end
  
    after_initialize do |student|
      puts "You have initialized an object!"
    end
  
    after_find do |student|
      puts "You have found an object!"
    end
  
    after_touch do |student|
      puts "You have touched an object"
    end
  end
  