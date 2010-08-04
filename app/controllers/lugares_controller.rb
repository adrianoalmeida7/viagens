class LugaresController < ApplicationController
  around_filter :neo4j_tx

  def index
    @lugares = Lugar.all.nodes
  end

  def new
    @lugar = Lugar.value_object.new
  end

  def create
    @lugar = Lugar.new
    @lugar.update(params[:lugar])
    flash[:notice] = 'Lugar acabou de ser criado!'
    redirect_to :action=>'index'
  end

  def destroy
    @lugar = Neo4j.load_node(params[:id])
    @lugar.del
    redirect_to :action=>'index'
  end

  private 

  def neo4j_tx
    Neo4j::Transaction.new
    yield
    Neo4j::Transaction.finish
  end
  
  
end