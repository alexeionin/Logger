create or replace force view logger_logs_5_min as
	select 
      id,
      logger_level,
      text,
      time_stamp,
      scope,
      module,
      action,
      user_name,
      client_identifier,
      call_stack,
      unit_name,
      line_no,
      scn,
      extra,
      sid,
      client_info,
      tid
    from logger_logs 
    where time_stamp > systimestamp - (5/1440)
/