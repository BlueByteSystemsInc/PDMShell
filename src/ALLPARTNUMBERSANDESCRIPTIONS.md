---
title: "SQL Example| Retrieving File Metadata from SOLIDWORKS PDM"
description: "SQL query example to extract SOLIDWORKS PDM file metadata (folder path, workflow state, configuration, and variables like Drawing No and Description). Often faster than PDM Search when exporting 1000+ results for reporting, migrations, and integrations."
---

## Retrieving File Metadata from SOLIDWORKS PDM

The following SQL query extracts metadata from a SOLIDWORKS PDM vault database. It returns file information including folder path, workflow state, configuration, and variable values such as **Drawing No** and **Description**.

This type of query is useful when building **reports, migrations, or integrations used with PDMShell automation**.

>[!IMPORTANT]
> Change `bluebyte` with your vault name to run the query below:

```sql
SELECT 
    D.DocumentID,
    P.ProjectID  AS [Folder], 
    P.Path  AS [Relative Path], 
    P.Name AS [Folder Name],
    D.Filename, 
    C.ConfigurationName AS [Configuration],
    S.Name AS [State],
    V1.ValueText AS [Drawing No], 
    V2.ValueText AS [Description],
    D.LatestRevisionNo AS [Latest Version]
FROM [bluebyte].[dbo].[Documents] D
LEFT JOIN [bluebyte].[dbo].[Status] S ON D.CurrentStatusID = S.StatusID
LEFT JOIN [bluebyte].[dbo].[DocumentsInProjects] PD ON D.DocumentID = PD.DocumentID
LEFT JOIN [bluebyte].[dbo].[Projects] P ON PD.ProjectID = P.ProjectID
CROSS JOIN [bluebyte].[dbo].[DocumentConfiguration] C 
LEFT JOIN [bluebyte].[dbo].[VariableValue] V1 ON V1.DocumentID = D.DocumentID 
    AND V1.ConfigurationID = C.ConfigurationID
    AND V1.RevisionNo = D.LatestRevisionNo
    AND V1.VariableID = (SELECT VariableID FROM [bluebyte].[dbo].[Variable] WHERE VariableName = 'Drawing No')
LEFT JOIN [bluebyte].[dbo].[VariableValue] V2 ON V2.DocumentID = D.DocumentID 
    AND V2.ConfigurationID = C.ConfigurationID
    AND V2.RevisionNo = D.LatestRevisionNo
    AND V2.VariableID = (SELECT VariableID FROM [bluebyte].[dbo].[Variable] WHERE VariableName = 'Description')
WHERE (D.Filename LIKE '%.sldprt' OR D.Filename LIKE '%.sldasm' OR D.Filename LIKE '%.slddrw')
  AND D.Deleted = 0
  AND C.ConfigurationName = '@';
```
## Output

![sqloutput](/images/sqloutput.png)

## Notes

SQL queries can be more efficient than the PDM Search API when exporting 1000+ results (reporting / migrations / integrations).
Use this approach for read-only extraction. Do not write to the PDM database directly.