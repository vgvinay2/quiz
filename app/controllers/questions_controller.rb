class QuestionsController < ApplicationController

  def index
    @questions = Question.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new_question
    @question = Question.new
  end

  def create_question
    @question = Question.new(params_questions)
    debugger
    @question.save
    render :partial => 'questions/question_list_temp'
  end

  def update_question
    params[:question][:existing_options] ||= {}
    params[:question][:verification_method_id] = params[:question][:verification_method_id], params[:verification_method_message]
    @question = Question.find(params[:id])
    render :template => 'questions/edit_question'
  end

  def delete_question
    @questions = Question.find(params[:document][:ids])
    @questions.each do |question|
      question.options.destroy_all
      question.verification_method.delete if question.verification_method
      question.delete
    end
  end

  def add_options_in_text
    render :partial => 'add_options_in_text'
  end

  def add_view_type
    @question = params[:question_id].blank? ? Question.new : Question.find( params[:question_id] )
    render :partial => 'view_type'
  end

  def pagination(template, component_hash, element_id)
    respond_to do |format|
      format.html do
        render :action => template
      end
      format.js do
        render :update do |page|
          page.replace_html element_id, component_table_list(component_hash), :page => params[:page]
        end
      end
    end
  end


  def params_questions
    debugger
    #params.required(:questions).permit(:question_type, :name, :prefilled_field_hint, :options_attributes=> :name)
    params.required(:questions).permit(:question_type, :name, :prefilled_field_hint, :options_attributes=> [:name, :default_value])
  end

end

