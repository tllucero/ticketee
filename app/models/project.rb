class Project < ActiveRecord::Base
	has_many :tickets

  attr_accessible :name
	validates :name, :presence => true
end
