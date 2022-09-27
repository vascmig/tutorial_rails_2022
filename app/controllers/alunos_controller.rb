class AlunosController < ApplicationController
  def new 
    @aluno = Aluno.new
  end
  def create
    @aluno = Aluno.new(aluno_params) 

    if @aluno.save
      redirect_to @aluno
    else
      
      if @aluno.errors.any? 
        puts @aluno.errors
        @aluno.errors.full_messages.each do |msg| 
          puts msg
        end
        render :new, status: :unprocessable_entity, content_type: "text/html"
        # NOTE: you can also set headers like this
        headers["Content-Type"] = "text/html"

        #render 'new'
      end
    end
  end

  def show
    @aluno = Aluno.find(params[:id])
  end
  
  private
  def aluno_params
    params.require(:aluno).permit(:nome, :email)
  end
end
