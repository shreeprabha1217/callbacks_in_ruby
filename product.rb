class Product < ApplicationRecord
    validates :price, numericality: { only_integer: true }
    validates :name, uniqueness: true
    before_save :normalize_name, if: :price_reasonable?
    # after_destroy :log_destroy_action
    after_destroy ObjectDestroyer.new
    after_create :log_new_product # Corrected syntax for after_create
    def price_reasonable?
      price<100
    end
    private
    
    def normalize_name
      self.name=name.gsub(/[ -]/, '')
    end
    # def log_destroy_action
    #   puts 'Product destroyed' # Changed "Article" to "Product"
    # end
  
    def log_new_product
      puts "A new product was registered"
    end
  end
  