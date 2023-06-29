package br.com.oncar.repository;

import br.com.oncar.cliente.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories
public interface ClienteRepository extends JpaRepository<Cliente, Long> {
}
