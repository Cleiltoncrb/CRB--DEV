package br.com.oncar.repository;

import br.com.oncar.carro.Carro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories
public interface CarroRepository extends JpaRepository<Carro, Long> {
}

