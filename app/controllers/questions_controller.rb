class QuestionsController < ApplicationController

  def index
    @page_properties = { :selected_menu => 'question_list', :menu_title => 'Questions' }
    @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id]
    respond_to do |format|
      format.html do
        render :action => 'index'
      end
      format.js do
        render :update do |page|
          page.replace_html 'question_new_list', component_table_list(@site.find_component_by_name('question_list'))
        end
      end
    end
  end

  def list
    @page_properties = { :selected_menu => 'question_list', :menu_title => 'Questions' }
    @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id]
    @company = Company.find(params[:company_id]) if params[:company_id]
    session[:per_page] = ( params[:per_page] ||= session[:per_page] || "30" )
  end

  def new_question
    @page_properties={:selected_menu=>'question_list',:menu_title=>'Create New Question'}
    @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id]
    @company = Company.find(params[:company_id]) if params[:company_id]
    @question = Question.new
  end

  def question_new_search
    @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id]
    @search = true
    render :action =>"list"
  end

  def create_question
    @question = Question.new(params[:question])
    @question.save
    render :partial => 'questions/question_list_temp'
  end

  def edit_question
    @page_properties={ :selected_menu => 'question_list', :menu_title => 'Edit Question' }
    @question = Question.find(params[:id])
    @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id]
    @company = Company.find(params[:company_id]) if params[:company_id]
    @verification_method = @question.verification_method
  end

  def update_question
    params[:question][:existing_options] ||= {}
    params[:question][:verification_method_id] = params[:question][:verification_method_id], params[:verification_method_message]
    @question = Question.find(params[:id])
    @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id]
    @company = Company.find(params[:company_id]) if params[:company_id]
    if @question.update_attributes(params[:question])
      redirect_to(
          if params[:campaign_id]
            { :controller => 'admin/questions' , :action => 'list', :campaign_id => params[:campaign_id] }
          elsif params[:company_id]
            { :controller => 'admin/questions' , :action => 'list', :company_id => params[:company_id] }
          else
            {:controller => 'admin/questions' , :action => 'list' }
          end)

    else
      render :template => 'admin/questions/edit_question'
    end
  end

  def delete_question
    @questions = Question.find(params[:document][:ids])
    @questions.each do |question|
      question.options.destroy_all
      question.verification_method.delete if question.verification_method
      question.delete
    end
    @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id]
    @company = Company.find(params[:company_id]) if params[:company_id]

    redirect_to(
        if params[:campaign_id]
          { :controller => 'admin/questions' , :action => 'list', :campaign_id => params[:campaign_id] }
        elsif params[:company_id]
          { :controller => 'admin/questions' , :action => 'list', :company_id => params[:company_id] }
        else
          {:controller => 'admin/questions' , :action => 'list' }
        end)
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

end

