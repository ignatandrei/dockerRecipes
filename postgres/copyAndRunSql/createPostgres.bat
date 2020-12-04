docker build -f postgres.txt --tag postgrescreate .
pause
echo can try -it instead of -d
docker run --rm -it --name postgrescontainer -p 5432:5432 postgrescreate