class CreaturesController < ApplicationController
	def index #GET
		@creatures = Creature.all
		render :index
	end
	def create
		creature_params = params.require(:creature).permit(:name, :description)
		@creature = Creature.new(creature_params)
		if @creature.save
			redirect_to "/creatures/#{creature.id}"
		end
	end
	def new
		@creature = Creature.new
		render :new
	end
	def edit
		id = params[:id]
		@creature = Creature.find[id]
		render :edit
	end
	def show 
		id = params[:id]
		@creature = Creature.find(id)
		render :show
	end
	def update 
		id = params[:id]
		creature = Creature.find(id)
		#get updated data
		updated_attributes = params.require(:creature).permit(:name, :description)
		#update sub-human
		creature.update_attributes(updated_attributes)
		#redirect to show
		redirect_to "/creatures/#{id}"
	end
	def destroy 
		id = params[:id]
		creature = Creature.find(id)
		creature.destroy
		redirect_to "/creatures"
	end
end

