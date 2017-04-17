class PersonasController < ApplicationController
  def new
    @persona = Persona.new
  end

  def create
    @persona = Persona.new(persona_params)
    if @persona.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  def persona_params
    params.require(:persona).permit(:username, :user_id)
  end
end
