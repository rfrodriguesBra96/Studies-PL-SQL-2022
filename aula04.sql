-- Exceções
    -- Ocorre dentro do BEGIN (por exemplo, um select)
    -- Quando ocorre uma exceção, não executa as proximas linhas
    -- Passa para EXCEPTION
    -- Se encontrar uma exceção que trata, encerrar no END
    -- Caso contrário, a exceção é propagada ( entre blocos, pode ser propaga para o ambiente chamador )
    
-- Tipos
    -- Pré-definidas
    -- Definidas pelo desenvolvedor RAISE
    -- Utilizando pragma
    
-- WHEN OTHERS
    -- Exceção genérica
    -- Deve ser o último tipo de tratamento de exceção definido
    
-- RAISE_APPLICATION_ERROR
    -- Procedure pré-definida. Usada para interromper o programa ao encontrar ume exceção
    -- Retorna uma mensagem e um código de erro (desenvolvedor informa).
    -- Codigo deve estar entre [-20000 - -20999]
    -- Mensagem deve ter no máximo 2048 bytes
    -- Opcional boolean para por erro na pilha de erros prévios