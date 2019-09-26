<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://demos.codexworld.com/includes/js/bootstrap.js"></script>

<title>Resource Allocation Report</title>
<body>
	<%
	Connection con = null;
	ResultSet resultSet = null;
	Statement stmt = null;
		try {

			
			Class.forName("oracle.jdbc.OracleDriver");
			 con = DriverManager.getConnection(
					"jdbc:oracle:thin:@zc4t00427.itcs.houston.dxccorp.net:1525:PPMESI", "STGEDS", "2017nov_ppmesi");
			stmt = con.createStatement();
			String id = request.getParameter("id");
			String sql = " SELECT * FROM  (WITH ear AS  ( SELECT gfe.emplid, gfe.email_addr ,ku.user_id AS resource_id  FROM ghrms_fte_extract gfe ,knta_users ku  WHERE gfe.manager_email = '"
					+ id
					+ "'  AND gfe.empl_status IN ('A','L','P')  AND ku.user_data15 = gfe.emplid  UNION  SELECT gce.hpid, gce.email_address ,ku.user_id AS resource_id  FROM ghrms_cwf_extract gce, knta_users ku  WHERE gce.manager_email = '"
					+ id
					+ "'  AND gce.empl_status IN ('A','L','P')  AND ku.user_data15 = gce.hpid  AND (gce.class LIKE 'A%'  OR gce.class IS NULL) ) SELECT rsc_pool.resource_pool_name, rsc_data.resource_name,  rsc_data.username,  rsc_data.mgr_mail,  rsc_data.request_id,  rsc_data.project_name,  rsc_data.position_id,  rsc_data.position_name,  rsc_data.allocation_status, rsc_data.CURRENT_MONTH, CASE WHEN ( rsc_data.allocation_status IS NULL AND rsc_data.CURRENT_MONTH <= 0.2 and rsc_data.CURRENT_MONTH >= -0.2  ) THEN '#39e600' WHEN ( rsc_data.allocation_status IS NULL AND (rsc_data.CURRENT_MONTH > 0.2 OR rsc_data.CURRENT_MONTH <-0.2) ) THEN '#e60000'  ELSE '' END COLOR_1,  rsc_data.NEXT_MONTH_1, CASE WHEN ( rsc_data.allocation_status IS NULL AND rsc_data.NEXT_MONTH_1 <= 0.2 and rsc_data.NEXT_MONTH_1 >= -0.2  ) THEN '#39e600' WHEN ( rsc_data.allocation_status IS NULL AND (rsc_data.NEXT_MONTH_1 > 0.2 OR rsc_data.NEXT_MONTH_1 <-0.2) ) THEN '#e60000'  ELSE '' END COLOR_2,  rsc_data.NEXT_MONTH_2, CASE WHEN ( rsc_data.allocation_status IS NULL AND rsc_data.NEXT_MONTH_2 <= 0.2 and rsc_data.NEXT_MONTH_2 >= -0.2  ) THEN '#39e600' WHEN ( rsc_data.allocation_status IS NULL AND (rsc_data.NEXT_MONTH_2 > 0.2 OR rsc_data.NEXT_MONTH_2 <-0.2) ) THEN '#e60000'  ELSE '' END COLOR_3,  rsc_data.NEXT_MONTH_3, CASE WHEN ( rsc_data.allocation_status IS NULL AND rsc_data.NEXT_MONTH_3 <= 0.2 and rsc_data.NEXT_MONTH_3 >= -0.2  ) THEN '#39e600' WHEN ( rsc_data.allocation_status IS NULL AND (rsc_data.NEXT_MONTH_3 > 0.2 OR rsc_data.NEXT_MONTH_3 <-0.2) ) THEN '#e60000'  ELSE '' END COLOR_4,  rsc_data.NEXT_MONTH_4, CASE WHEN ( rsc_data.allocation_status IS NULL AND rsc_data.NEXT_MONTH_4 <= 0.2 and rsc_data.NEXT_MONTH_4 >= -0.2  ) THEN '#39e600' WHEN ( rsc_data.allocation_status IS NULL AND (rsc_data.NEXT_MONTH_4 > 0.2 OR rsc_data.NEXT_MONTH_4 <-0.2) ) THEN '#e60000'  ELSE '' END COLOR_5,  rsc_data.NEXT_MONTH_5, CASE WHEN ( rsc_data.allocation_status IS NULL AND rsc_data.NEXT_MONTH_5 <= 0.2 and rsc_data.NEXT_MONTH_5 >= -0.2  ) THEN '#39e600' WHEN ( rsc_data.allocation_status IS NULL AND (rsc_data.NEXT_MONTH_5 > 0.2 OR rsc_data.NEXT_MONTH_5 <-0.2) ) THEN '#e60000'  ELSE '' END COLOR_6,  rsc_data.NEXT_MONTH_6, CASE WHEN ( rsc_data.allocation_status IS NULL AND rsc_data.NEXT_MONTH_6 <= 0.2 and rsc_data.NEXT_MONTH_6 >= -0.2  ) THEN '#39e600' WHEN ( rsc_data.allocation_status IS NULL AND (rsc_data.NEXT_MONTH_6 > 0.2 OR rsc_data.NEXT_MONTH_6 <-0.2) ) THEN '#e60000'  ELSE '' END COLOR_7,  rsc_data.NEXT_MONTH_7, CASE WHEN ( rsc_data.allocation_status IS NULL AND rsc_data.NEXT_MONTH_7 <= 0.2 and rsc_data.NEXT_MONTH_7 >= -0.2  ) THEN '#39e600' WHEN ( rsc_data.allocation_status IS NULL AND (rsc_data.NEXT_MONTH_7 > 0.2 OR rsc_data.NEXT_MONTH_7 <-0.2) ) THEN '#e60000'  ELSE '' END COLOR_8,  rsc_data.NEXT_MONTH_8, CASE WHEN ( rsc_data.allocation_status IS NULL AND rsc_data.NEXT_MONTH_8 <= 0.2 and rsc_data.NEXT_MONTH_8 >= -0.2  ) THEN '#39e600' WHEN ( rsc_data.allocation_status IS NULL AND (rsc_data.NEXT_MONTH_8 > 0.2 OR rsc_data.NEXT_MONTH_8 <-0.2) ) THEN '#e60000'  ELSE '' END COLOR_9 FROM  (SELECT data_table.resource_name, data_table.username,    data_table.mgr_mail,    data_table.request_id,    data_table.project_name,    data_table.position_id,    data_table.position_name,    data_table.allocation_status,    ROUND (data_table.CURRENT_MONTH / capacity.CURRENT_MONTH, 2) CURRENT_MONTH,  ROUND (data_table.NEXT_MONTH_1  / capacity.NEXT_MONTH_1, 2) NEXT_MONTH_1,    ROUND (data_table.NEXT_MONTH_2  / capacity.NEXT_MONTH_2, 2) NEXT_MONTH_2,    ROUND (data_table.NEXT_MONTH_3  / capacity.NEXT_MONTH_3, 2) NEXT_MONTH_3,    ROUND (data_table.NEXT_MONTH_4  / capacity.NEXT_MONTH_4, 2) NEXT_MONTH_4,    ROUND (data_table.NEXT_MONTH_5  / capacity.NEXT_MONTH_5, 2) NEXT_MONTH_5,    ROUND (data_table.NEXT_MONTH_6  / capacity.NEXT_MONTH_6, 2) NEXT_MONTH_6,    ROUND (data_table.NEXT_MONTH_7  / capacity.NEXT_MONTH_7, 2) NEXT_MONTH_7,    ROUND (data_table.NEXT_MONTH_8  / capacity.NEXT_MONTH_8, 2) NEXT_MONTH_8  FROM (SELECT ku.full_name resource_name, ku.username,  km.username Mgr_mail, kfpp.request_id request_id, kfpp.prj_project_name project_name,  rp.position_id,      rp.position_name, DECODE (rra.status_code, 1, 'Soft Booked', 2, 'Committed') allocation_status,  SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (SYSDATE, 'MM/YYYY'), rspa.allocation_value, 0)) CURRENT_MONTH,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 1), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_1,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 2), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_2,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 3), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_3,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 4), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_4,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 5), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_5,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 6), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_6,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 7), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_7,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 8), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_8    FROM kcrt_fg_pfm_project kfpp,      rsc_staffing_profiles rsp,      rsc_positions rp,      rsc_resource_assignments rra,      rsc_staff_prof_allocation rspa,      knta_users ku,      knta_users km,      rsc_resources rr,      ear,      (SELECT DISTINCT rrde.resource_id FROM  (SELECT resource_pool_id FROM rsc_resource_pools WHERE enabled_flag = 'Y') rsc_pools, rsc_rp_distribution_entries rrde  WHERE rrde.resource_pool_id  = rsc_pools.resource_pool_id      AND TRUNC (NVL (rrde.finish_time, SYSDATE)) >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')) resources    WHERE rr.resource_id  = resources.resource_id    AND ear.resource_id = ku.user_id    AND rr.user_id                 = ku.user_id    AND (ku.end_date              IS NULL    OR ku.end_date                 > SYSDATE)    AND rra.resource_id  = rr.resource_id    AND rra.position_id  = rp.position_id    AND rp.status_code <> 5    AND km.user_id  = ku.manager_user_id    AND rp.staffing_profile_id     = rsp.staffing_profile_id    AND rsp.status_code NOT       IN (4, 5)    AND kfpp.prj_staff_prof_id     = rsp.staffing_profile_id    AND rra.resource_assignment_id = rspa.assignment_id    AND rspa.allocation_date >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')    AND rspa.allocation_date <= TRUNC (LAST_DAY (ADD_MONTHS (SYSDATE, 8)))    AND rspa.allocation_value > 0    GROUP BY ku.full_name, ku.username,      km.username,      kfpp.request_id,      kfpp.prj_project_name,      rp.position_id,      rp.position_name, rra.status_code ) data_table, (SELECT ku.username username,      SUM ( DECODE (TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (SYSDATE, 'MM/YYYY'), kcs.duration, 0)) CURRENT_MONTH,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 1), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_1,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 2), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_2,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 3), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_3,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 4), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_4,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 5), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_5,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 6), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_6,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 7), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_7,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 8), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_8    FROM kdrv_working_days kwd,      ppmedsadmin.knta_regions_nls kr,      kdrv_calendar_setups kcs,      knta_users ku,      (SELECT DISTINCT rrde.resource_id  FROM (SELECT resource_pool_id FROM rsc_resource_pools WHERE enabled_flag = 'Y') rsc_pools, rsc_rp_distribution_entries rrde      WHERE rrde.resource_pool_id = rsc_pools.resource_pool_id  AND TRUNC (NVL (rrde.finish_time, SYSDATE)) >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')      ) resources,      rsc_resources rr,      ear    WHERE rr.resource_id          = resources.resource_id    AND ear.resource_id           = ku.user_id    AND rr.user_id = ku.user_id    AND (ku.end_date  IS NULL OR ku.end_date                > SYSDATE)    AND ku.region_id              = kr.region_id    AND kwd.calendar_id           = kr.calendar_id    AND kwd.working_day_flag      = 'Y'    AND kwd.working_day_date NOT IN      (SELECT event_date      FROM kdrv_calendar_exceptions      WHERE calendar_id    = ku.calendar_id      AND working_day_flag = 'N'      )    AND kwd.working_day_date  <= NVL ( ku.end_date, TRUNC (LAST_DAY (ADD_MONTHS (SYSDATE, 8))))    AND (kwd.working_day_date >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')    AND kwd.working_day_date  <= TRUNC (LAST_DAY (ADD_MONTHS (SYSDATE, 8))))    AND kcs.calendar_id        = kr.calendar_id    GROUP BY ku.username    ) capacity  WHERE data_table.username = capacity.username  UNION  SELECT data_table.full_name resource_name,    data_table.username,    data_table.mgr_mail,    NULL request_id,    '(Available Capacity)' project_name,    NULL position_id,    NULL position_name,    NULL allocation_status,    ROUND ( 1 - (data_table.CURRENT_MONTH / capacity.CURRENT_MONTH), 2) CURRENT_MONTH,    ROUND (1  - (data_table.NEXT_MONTH_1 / capacity.NEXT_MONTH_1), 2) NEXT_MONTH_1,    ROUND (1  - (data_table.NEXT_MONTH_2 / capacity.NEXT_MONTH_2), 2) NEXT_MONTH_2,    ROUND (1  - (data_table.NEXT_MONTH_3 / capacity.NEXT_MONTH_3), 2) NEXT_MONTH_3,    ROUND (1  - (data_table.NEXT_MONTH_4 / capacity.NEXT_MONTH_4), 2) NEXT_MONTH_4,    ROUND (1  - (data_table.NEXT_MONTH_5 / capacity.NEXT_MONTH_5), 2) NEXT_MONTH_5,    ROUND (1  - (data_table.NEXT_MONTH_6 / capacity.NEXT_MONTH_6), 2) NEXT_MONTH_6,    ROUND (1  - (data_table.NEXT_MONTH_7 / capacity.NEXT_MONTH_7), 2) NEXT_MONTH_7,    ROUND (1  - (data_table.NEXT_MONTH_8 / capacity.NEXT_MONTH_8), 2) NEXT_MONTH_8  FROM    (SELECT ku.full_name,      ku.username,      km.username mgr_mail,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (SYSDATE, 'MM/YYYY'), rspa.allocation_value, 0)) CURRENT_MONTH,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 1), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_1,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 2), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_2,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 3), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_3,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 4), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_4,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 5), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_5,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 6), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_6,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 7), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_7,      SUM ( DECODE ( TO_CHAR (rspa.allocation_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 8), 'MM/YYYY'), rspa.allocation_value, 0)) NEXT_MONTH_8    FROM rsc_staffing_profiles rsp,      rsc_positions rp,      rsc_resource_assignments rra,      rsc_staff_prof_allocation rspa,      knta_users ku,      knta_users km,      rsc_resources rr,      ear,      (SELECT DISTINCT rrde.resource_id      FROM        (SELECT resource_pool_id FROM rsc_resource_pools WHERE enabled_flag = 'Y'        ) rsc_pools,        rsc_rp_distribution_entries rrde      WHERE rrde.resource_pool_id                  = rsc_pools.resource_pool_id      AND TRUNC (NVL (rrde.finish_time, SYSDATE)) >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')      ) resources    WHERE rr.resource_id           = resources.resource_id    AND ear.resource_id            = ku.user_id    AND rr.user_id                 = ku.user_id    AND km.user_id                 = ku.manager_user_id    AND (ku.end_date              IS NULL    OR ku.end_date                 > SYSDATE)    AND rra.resource_id            = rr.resource_id    AND rra.position_id            = rp.position_id    AND rp.status_code            <> 5    AND rp.staffing_profile_id     = rsp.staffing_profile_id    AND rsp.status_code NOT       IN (4, 5)    AND rra.resource_assignment_id = rspa.assignment_id    AND rspa.allocation_date      >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')    AND rspa.allocation_date      <= TRUNC (LAST_DAY (ADD_MONTHS (SYSDATE, 8)))    AND rspa.allocation_value      > 0    GROUP BY ku.full_name,      ku.username,      km.username    ) data_table,    (SELECT ku.username username,      SUM ( DECODE (TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (SYSDATE, 'MM/YYYY'), kcs.duration, 0)) CURRENT_MONTH,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 1), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_1,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 2), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_2,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 3), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_3,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 4), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_4,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 5), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_5,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 6), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_6,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 7), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_7,      SUM ( DECODE ( TO_CHAR (kwd.working_day_date, 'MM/YYYY'), TO_CHAR (ADD_MONTHS (SYSDATE, 8), 'MM/YYYY'), kcs.duration, 0)) NEXT_MONTH_8    FROM kdrv_working_days kwd,      ppmedsadmin.knta_regions_nls kr,      kdrv_calendar_setups kcs,      knta_users ku,      (SELECT DISTINCT rrde.resource_id      FROM        (SELECT resource_pool_id FROM rsc_resource_pools WHERE enabled_flag = 'Y'        ) rsc_pools,        rsc_rp_distribution_entries rrde      WHERE rrde.resource_pool_id                  = rsc_pools.resource_pool_id      AND TRUNC (NVL (rrde.finish_time, SYSDATE)) >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')      ) resources,      rsc_resources rr,      ear    WHERE rr.resource_id          = resources.resource_id    AND ear.resource_id           = ku.user_id    AND rr.user_id                = ku.user_id    AND (ku.end_date             IS NULL    OR ku.end_date                > SYSDATE)    AND ku.region_id              = kr.region_id    AND kwd.calendar_id           = kr.calendar_id    AND kwd.working_day_flag      = 'Y'    AND kwd.working_day_date NOT IN      (SELECT event_date      FROM kdrv_calendar_exceptions      WHERE calendar_id    = ku.calendar_id      AND working_day_flag = 'N'      )    AND kwd.working_day_date  <= NVL ( ku.end_date, TRUNC (LAST_DAY (ADD_MONTHS (SYSDATE, 8))))    AND (kwd.working_day_date >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')    AND kwd.working_day_date  <= TRUNC (LAST_DAY (ADD_MONTHS (SYSDATE, 8))))    AND kcs.calendar_id        = kr.calendar_id    GROUP BY ku.username    ) capacity  WHERE data_table.username = capacity.username  UNION  SELECT ku.full_name resource_name,    ku.username username,    km.username mgr_mail,    NULL request_id,    '(Available Capacity)' project_name,    NULL position_id,    NULL position_name,    NULL allocation_status,    1 CURRENT_MONTH,    1 NEXT_MONTH_1,    1 NEXT_MONTH_2,    1 NEXT_MONTH_3,    1 NEXT_MONTH_4,    1 NEXT_MONTH_5,    1 NEXT_MONTH_6,    1 NEXT_MONTH_7,    1 NEXT_MONTH_8  FROM knta_users ku,    knta_users km,    rsc_resource_pools rrp,    rsc_resources rr,    ear,    (SELECT DISTINCT rrde.resource_id    FROM      (SELECT resource_pool_id FROM rsc_resource_pools WHERE enabled_flag = 'Y'      ) rsc_pools,      rsc_rp_distribution_entries rrde    WHERE rrde.resource_pool_id                  = rsc_pools.resource_pool_id    AND TRUNC (NVL (rrde.finish_time, SYSDATE)) >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')    ) resources  WHERE rr.resource_id    = resources.resource_id  AND ear.resource_id     = ku.user_id  AND rr.user_id          = ku.user_id  AND km.user_id          = ku.manager_user_id  AND (ku.end_date       IS NULL  OR ku.end_date          > SYSDATE)  AND rr.resource_id NOT IN    (SELECT rra.resource_id    FROM rsc_staffing_profiles rsp,      rsc_positions rp,      rsc_resource_assignments rra,      rsc_staff_prof_allocation rspa    WHERE rra.resource_id          = rr.resource_id    AND rra.position_id            = rp.position_id    AND rp.status_code            <> 5    AND rp.staffing_profile_id     = rsp.staffing_profile_id    AND rsp.status_code NOT       IN (4, 5)    AND rra.resource_assignment_id = rspa.assignment_id    AND rspa.allocation_date      >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')    AND rspa.allocation_date      <= TRUNC ( LAST_DAY (ADD_MONTHS (SYSDATE, 8)))    AND rspa.allocation_value > 0    )  GROUP BY rrp.resource_pool_name,    ku.full_name,    ku.username,    km.username  ) rsc_data,  (SELECT DISTINCT ku.full_name resource_name,    ku.username username,    pools.resource_pool_name resource_pool_name  FROM    (SELECT resource_pool_id,      resource_pool_name    FROM rsc_resource_pools    WHERE enabled_flag = 'Y'    ) pools,    rsc_rp_distribution_entries rrde,    knta_users ku,    rsc_resources rr,    ear  WHERE rrde.resource_pool_id   = pools.resource_pool_id  AND TRUNC (NVL (rrde.finish_time, SYSDATE)) >= TO_DATE (TO_CHAR (SYSDATE, 'MM/YYYY'), 'MM/YYYY')  AND rrde.resource_id    = rr.resource_id  AND ear.resource_id  = ku.user_id  AND rr.user_id    = ku.user_id  ) rsc_pool WHERE rsc_data.username = rsc_pool.username ORDER BY rsc_pool.resource_pool_name,  rsc_data.resource_name,  rsc_data.request_id,  rsc_data.project_name,  rsc_data.allocation_status  ) ";

			resultSet = stmt.executeQuery(sql);
			/* if (!resultSet.next()) {
				out.println("<h1 style='color:#e60000'>Sorry, could not find the Requested Email_ID.</h1>");
			} else { */
				
	%>


	<h2 align="center">
		<font color="black"><strong>Resource Allocation Report</strong></font>
	</h2>
	<h2 align="right">
		<input type="button"
			onclick="tableToExcel('testTable', 'Resource_Allocation_Report')"
			value="Export to Excel">
	</h2>


	<table id="testTable" BORDER="1" align="center" cellpadding="3"
		cellspacing="4">

		<tr align="center" bgcolor="#DCDCDC" style="font-family: serif">
			<td><b>RESOURCE_POOL_NAME</b></td>
			<td><b>RESOURCE_NAME</b></td>
			<td><b>USERNAME</b></td>
			<td><b>MGR_MAIL </b></td>
			<td><b>REQUEST_ID</b></td>
			<td><b>PROJECT_NAME</b></td>
			<td><b>POSITION_ID</b></td>
			<td><b>POSITION_NAME</b></td>
			<td><b>ALLOCATION_STATUS</b></td>
			<td><b>CURRENT_MONTH</b></td>
			<td><b>NEXT_MONTH_1</b></td>
			<td><b>NEXT_MONTH_2</b></td>
			<td><b>NEXT_MONTH_3</b></td>
			<td><b>NEXT_MONTH_4</b></td>
			<td><b>NEXT_MONTH_5</b></td>
			<td><b>NEXT_MONTH_6</b></td>
			<td><b>NEXT_MONTH_7</b></td>
			<td><b>NEXT_MONTH_8</b></td>
		</tr>

		<%
		int count =0;
			while (resultSet.next()) {
				count++;
						/* response.setContentType("application/vnd.ms-excel");
						response.setHeader("Content-Disposition",
							"inline; filename=" + "Resource_Allocation_Report.xls"); */
		%>

		<tr style="font-family: serif">
			<td align="left"><%=resultSet.getString("RESOURCE_POOL_NAME")%></td>
             
			<td align="left"><%=resultSet.getString("RESOURCE_NAME")%></td>
			<td align="center"><%=resultSet.getString("USERNAME")%></td>
			<td align="left"><%=resultSet.getString("MGR_MAIL")%></td>
			<%
				String var = resultSet.getString("REQUEST_ID");
							if (var == null) {
								var = "";
							}
			%>
			<td align="right"><%=var%></td>
			<td align="left"><%=resultSet.getString("PROJECT_NAME")%></td>
			<%
				String var1 = resultSet.getString("POSITION_ID");
							if (var1 == null) {
								var1 = "";
							}
			%>
			<td align="right"><%=var1%></td>
			<%
				String var2 = resultSet.getString("POSITION_NAME");
							if (var2 == null) {
								var2 = "";
							}
			%>
			<td align="left"><%=var2%></td>
			<%
				String var3 = resultSet.getString("ALLOCATION_STATUS");
							if (var3 == null) {
								var3 = "";
							}
			%>
			<td align="left"><%=var3%></td>
			<td align="right" bgcolor="<%=resultSet.getString("COLOR_1")%>"><%=resultSet.getString("CURRENT_MONTH")%></td>
			<td align="right" bgcolor="<%=resultSet.getString("COLOR_2")%>"><%=resultSet.getString("NEXT_MONTH_1")%></td>
			<td align="right" bgcolor="<%=resultSet.getString("COLOR_3")%>"><%=resultSet.getString("NEXT_MONTH_2")%></td>
			<td align="right" bgcolor="<%=resultSet.getString("COLOR_4")%>"><%=resultSet.getString("NEXT_MONTH_3")%></td>
			<td align="right" bgcolor="<%=resultSet.getString("COLOR_5")%>"><%=resultSet.getString("NEXT_MONTH_4")%></td>
			<td align="right" bgcolor="<%=resultSet.getString("COLOR_6")%>"><%=resultSet.getString("NEXT_MONTH_5")%></td>
			<td align="right" bgcolor="<%=resultSet.getString("COLOR_7")%>"><%=resultSet.getString("NEXT_MONTH_6")%></td>
			<td align="right" bgcolor="<%=resultSet.getString("COLOR_8")%>"><%=resultSet.getString("NEXT_MONTH_7")%></td>
			<td align="right" bgcolor="<%=resultSet.getString("COLOR_9")%>"><%=resultSet.getString("NEXT_MONTH_8")%></td>

		</tr>

		<%
			}if(count==0){
			out.println("<h1 style='color:#e60000'>Sorry, could not find the Requested Email_ID.</h1>");
		}
				

			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				try {
					if (resultSet != null)
						resultSet.close();
					if (stmt != null)
						stmt.close();
					if (con != null)
						con.close();

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		%>

	</table>

	<script type="text/javascript">
		var tableToExcel = (function() {
			var uri = 'data:application/vnd.ms-excel;base64,', template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>', base64 = function(
					s) {
				return window.btoa(unescape(encodeURIComponent(s)))
			}, format = function(s, c) {
				return s.replace(/{(\w+)}/g, function(m, p) {
					return c[p];
				})
			}
			return function(table, name) {
				if (!table.nodeType)
					table = document.getElementById(table)
				var ctx = {
					worksheet : name || 'Worksheet',
					table : table.innerHTML
				}
				window.location.href = uri + base64(format(template, ctx))
			}
		})()
	</script>
	
	
</body>
</html>