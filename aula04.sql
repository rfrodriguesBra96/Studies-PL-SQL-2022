-- Exce��es
    -- Ocorre dentro do BEGIN (por exemplo, um select)
    -- Quando ocorre uma exce��o, n�o executa as proximas linhas
    -- Passa para EXCEPTION
    -- Se encontrar uma exce��o que trata, encerrar no END
    -- Caso contr�rio, a exce��o � propagada ( entre blocos, pode ser propaga para o ambiente chamador )
    
-- Tipos
    -- Pr�-definidas
    -- Definidas pelo desenvolvedor RAISE
    -- Utilizando pragma
    
-- WHEN OTHERS
    -- Exce��o gen�rica
    -- Deve ser o �ltimo tipo de tratamento de exce��o definido
    
-- RAISE_APPLICATION_ERROR
    -- Procedure pr�-definida. Usada para interromper o programa ao encontrar ume exce��o
    -- Retorna uma mensagem e um c�digo de erro (desenvolvedor informa).
    -- Codigo deve estar entre [-20000 - -20999]
    -- Mensagem deve ter no m�ximo 2048 bytes
    -- Opcional boolean para por erro na pilha de erros pr�vios