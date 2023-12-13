# can't delete or update the parent row
# foreign key constaint will fail
# we have to delete every one who have reference on this before delete this
delete from singer where id = 2;

# https://www.notion.so/69af77766c47449ca45bf7b2d12daf23?pvs=4#1d87377c1b054265b121c1e9b070a095