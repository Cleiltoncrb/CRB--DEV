package br.com.oncar.carro;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CarroRepository extends JpaRepository<CarroCliente, Long> {
}
