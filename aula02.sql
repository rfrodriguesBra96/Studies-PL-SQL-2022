-- Criando uma Agenda
-- repeat_interval (FREQ=yearly, monthly, weekly, daily, hourly, minutely, secondly)
-- repeat_interval INTERVAL=1-99
BEGIN
    DBMS_SCHEDULER.CREATE_SCHEDULE (
        schedule_name  => 'SCH_A_CADA_10_SEGUNDOS', -- nome do schedule
        start_date     => SYSTIMESTAMP, -- data que especifica quando o schedule se tornara ativo
        --start_date => TO_TIMESTAMP_TZ('2020-03-17 15:17:36.000000000 AMERICA/SAO_PAULO','YYYY-MM-DD HH24:MI:SS.FF TZR'),
        repeat_interval  => 'FREQ=SECONDLY;INTERVAL=10', -- frequencia de repetição
        -- data que especifica quando o schedule se tornara inativo
        end_date => TO_TIMESTAMP_TZ('2022-06-16 02:59:59.000000000 AMERICA/SAO_PAULO','YYYY-MM-DD HH24:MI:SS.FF TZR'),
        comments => 'A cada 10 segundos'
        );
END;
 
--Removendo um Schedule 
 
BEGIN
    DBMS_SCHEDULER.DROP_SCHEDULE (
        schedule_name  => 'SCH_A_CADA_10_SEGUNDOS',
        force    => FALSE
        );
END;


