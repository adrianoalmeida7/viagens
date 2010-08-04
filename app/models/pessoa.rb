class Pessoa
  include Neo4j::NodeMixin
  property :nome, :data_nascimento
  
  has_n(:viajou_para).to(Lugar)
  
  index :nome
end