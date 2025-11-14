# Part 1 - CSVServer Solution

#This README contains all the commands executed to complete Part-1 of the assignment.
1. Pulled required Docker images
docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.45.2
2. Tried running the csvserver container (failed due to missing input file)
docker run -d --name csvserver infracloudio/csvserver:latest
docker logs csvserver
docker rm -f csvserver
3. Created script to generate inputFile
Created gencsv.sh, made it executable, and generated the file:
nano gencsv.sh
chmod +x gencsv.sh
./gencsv.sh 2 8
cat inputFile
This produced a file named inputFile with 7 entries (index 2 to 8)
4. Ran the container with inputFile mounted
docker run -d \
  --name csvserver \
  -v "$PWD/inputFile:/csvserver/inputdata" \
  -p 9393:9300 \
  infracloudio/csvserver:latest

5. Checked the port on which the application listens
docker exec -it csvserver bash
netstat -tulnp
exit

Service was listening on port 9300.

Stopped the container: docker rm -f csvserver

6. Ran the container with correct port mapping and border color
docker run -d \
  --name csvserver \
  -v "$PWD/inputFile:/csvserver/inputdata" \
  -p 9393:9300 \
  -e CSVSERVER_BORDER=Orange \
  infracloudio/csvserver:latest
Application accessible at:
http://localhost:9393
http://65.0.170.157:9393/
 web output is attached with mail

7. Saved required outputs
file name is part-1-cmd
command

echo 'docker run -d --name csvserver -v "$PWD/inputFile:/csvserver/inputdata" -p 9393:9300 -e CSVSERVER_BORDER=Orange infracloudio/csvserver:latest' > part-1-cmd


part-1-output
curl -o ./part-1-output http://localhost:9393/raw

part-1-logs
docker logs csvserver >& part-1-logs


Files present in the solution directory for part 1
gencsv.sh
inputFile
part-1-cmd
part-1-output
part-1-logs
README.md


o
Part 1 completed
============================================================================

