class ChoicesController < ApplicationController
  def vote
    @choice = Choice.find(params[:id])
    @choice.vote
    @choice.save

    redirect_to question_path(:id => @choice.question.id)
  end

  # GET /choices/1
  # GET /choices/1.json
  def show
    @choice = Choice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @choice }
    end
  end

  # GET /choices/new
  def new
    @question = Question.find(params[:question_id])
    @choice = @question.choices.build
  end

  # GET /choices/1/edit
  def edit
    @choice = Choice.find(params[:id])
  end

  # POST /choices
  def create
    @choice = Choice.new(params[:choice])

    if @choice.save
      redirect_to question_path(:id => @choice.question.id), notice: 'Choice was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /choices/1
  # PUT /choices/1.json
  def update
    @choice = Choice.find(params[:id])

    respond_to do |format|
      if @choice.update_attributes(params[:choice])
        format.html { redirect_to @choice, notice: 'Choice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /choices/1
  # DELETE /choices/1.json
  def destroy
    @choice = Choice.find(params[:id])
    @choice.destroy

    respond_to do |format|
      format.html { redirect_to choices_url }
      format.json { head :no_content }
    end
  end
end
