class PollsController < ApplicationController
  def index
  	@question = Question.current
  	@choices = @question.choices
  end

  def results
  	@selected_choice = Choice.find(params[:choice_id])
  	@selected_choice.vote

 		@question = @selected_choice.question
 		@choices = @question.choices

 		unless @selected_choice.save
 			render :index, :notice => "Sorry we were not able to save your vote :("
 		end
  end
end
