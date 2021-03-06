/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 100 [StatsSystemMonitorCountsMinuteID]
      ,[StatDate]
      ,B.Name AS Mediator
      ,A.Name AS SystemMonitor
      ,[CountLogs]
      ,[CountProcessedLogs]
      ,[CountOnlineLogs]
      ,[HostsCollectedFrom]
  FROM [LogRhythm_LogMart].[dbo].[StatsSystemMonitorCountsMinute]
  INNER JOIN [LogRhythmEMDB].[dbo].[SystemMonitor] AS A
	ON [LogRhythm_LogMart].[dbo].[StatsSystemMonitorCountsMinute].[SystemMonitorID] = A.SystemMonitorID
  INNER JOIN [LogRhythmEMDB].[dbo].[Mediator] AS B
	ON [LogRhythm_LogMart].[dbo].[StatsSystemMonitorCountsMinute].[MediatorID] = B.MediatorID
  WHERE StatDate > DATEADD(minute, -2, GETUTCDATE()) 
  ORDER BY StatsSystemMonitorCountsMinuteID DESC