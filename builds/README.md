# Morgue builds

Morgue consists of two containers:
- aabbate/morguedb which is built starting from aabbate/mariadb container
- aabbate/morgue which is built from scratch

Both containers use Alpine Linux as base. The `firstbuild.sh` script for morguedb is used only for the first build, in order to initialize the database and to add the schemas.
