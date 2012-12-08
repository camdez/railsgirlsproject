class Question < ActiveRecord::Base
	has_many :choices, :order => :position

  def self.current
    Question.where(:current => 1).first
  end
end
