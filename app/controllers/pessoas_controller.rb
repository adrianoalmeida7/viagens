class PessoasController < ApplicationController
  around_filter :neo4j_tx
  
  def index
    @pessoas = Pessoa.all.nodes
  end
  
  def new
    @pessoa = Pessoa.value_object.new
  end
  
  def create
    @pessoa = Pessoa.new
    @pessoa.update(params[:pessoa])
    flash[:notice] = 'Pessoa acabou de ser criada!'
    redirect_to :action=>'index'
  end
  
  def destroy
    @pessoa = Neo4j.load_node(params[:id])
    @pessoa.del
    redirect_to :action=>'index'
  end

=begin
  def index
     @actors = Actor.all.nodes
   end

   def create
     @actor = Actor.new
     @actor.update(params[:actor])
     flash[:notice] = 'Actor was successfully created.'
     redirect_to(@actor)
   end

   def update
     @actor.update(params[:actor])
     flash[:notice] = 'Actor was successfully updated.'
     redirect_to(@actor)
   end

   def destroy
     @actor.del
     redirect_to(actors_url)
   end

   def edit
   end

   def show
     @movies = Movie.all.nodes
   end

   def link
     @movie = Neo4j.load_node(params[:movie_id])
     rel1 = @actor.acted_in.new(@movie)
     rel1.character = params[:character]
     redirect_to(@actor)
   end

   def unlink
     relationship = Neo4j.load_rel(params[:rel_id])
     relationship.del
     redirect_to(@actor)
   end

   def new
     @actor = Actor.value_object.new
   end
=end
  
  private 
  
  def neo4j_tx
    Neo4j::Transaction.new
    yield
    Neo4j::Transaction.finish
  end
end