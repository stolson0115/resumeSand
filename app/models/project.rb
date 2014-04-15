class Project < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum:5},length: {maximum:140}
	validates :category, presence: true,length: {maximum:140}
	validates :text, presence:true, length: {maximum:140}	
end
