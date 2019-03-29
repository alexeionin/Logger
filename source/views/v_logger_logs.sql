create or replace force view v_logger_logs as
	select
      id,
      logger_level,
      text,
      time_stamp,
      l.time_stamp - LAG(l.time_stamp) 
        OVER (PARTITION BY l.sid, l.module, l.action 
          ORDER BY l.time_stamp desc, l.id DESC
        ) AS duration,  
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
    from logger_logs l
/
