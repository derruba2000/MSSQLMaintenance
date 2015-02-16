SELECT  sys.schemas.name AS SchemaName, sys.objects.name AS ObjectName, sys.objects.object_id, 
    sys.objects.type AS ObjectType, sys.objects.type_desc AS TypeDescription, sys.extended_properties.name AS PropertyName, 
	sys.extended_properties.value AS Description
FROM  sys.extended_properties right OUTER JOIN
    sys.objects ON sys.extended_properties.major_id = sys.objects.object_id LEFT OUTER JOIN
    sys.schemas ON sys.schemas.schema_id = sys.objects.schema_id
WHERE  (sys.objects.is_ms_shipped = 0)
ORDER BY sys.schemas.name, sys.objects.type, sys.objects.name
