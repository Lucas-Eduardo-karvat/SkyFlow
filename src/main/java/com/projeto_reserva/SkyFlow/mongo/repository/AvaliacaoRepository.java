package com.projeto_reserva.SkyFlow.mongo.repository;

import java.util.List;
import com.projeto_reserva.SkyFlow.mongo.model.Avaliacao;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AvaliacaoRepository extends MongoRepository<Avaliacao, String> {
    List<Avaliacao> findByVooId(Long vooId);

}