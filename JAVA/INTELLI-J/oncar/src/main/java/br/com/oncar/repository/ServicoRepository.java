package br.com.oncar.repository;

import br.com.oncar.servico.OrdemDeServico;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServicoRepository extends JpaRepository<OrdemDeServico, Long> {
}
