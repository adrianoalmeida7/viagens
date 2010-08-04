class ViagensController < ApplicationController
  around_filter :neo4j_tx

  def new
    @pessoas = Pessoa.all.nodes
    @lugares = Lugar.all.nodes
  end
  
  def create
    @pessoa = Neo4j.load_node params[:pessoa_id]
    @lugar = Neo4j.load_node params[:lugar_id]
    puts "Ligando: #{@pessoa.nome} com #{@lugar.cidade}"
    @pessoa.viajou_para << @lugar
    
    redirect_to :controller=>'pessoas', :action=>'index'
  end
  
  private
  def neo4j_tx
    Neo4j::Transaction.new
    yield
    Neo4j::Transaction.finish
  end
end