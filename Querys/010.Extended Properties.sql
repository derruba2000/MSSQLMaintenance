select p.*, t.*
from sys.extended_properties p
inner join sys.tables t on p.major_id = t.object_id
