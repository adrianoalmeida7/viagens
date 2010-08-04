class Lugar
  include Neo4j::NodeMixin
  
  property :cidade, :pais
  
  has_n(:pessoas).from(Pessoa, :viajou_para)
end