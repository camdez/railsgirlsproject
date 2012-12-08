class Choice < ActiveRecord::Base
  belongs_to :question

  def vote
  	self.count = count + 1
  end
end
