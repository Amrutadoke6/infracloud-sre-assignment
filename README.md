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

Part II – Docker Compose Setup
Convert the Part-1 setup into a docker-compose.yaml-based solution using an environment variable file.
Steps Performed

Deleted existing containers from Part-1 docker rm -f csvserver

Created csvserver.env
This file contains the environment variables required by the csvserver container. CSVSERVER_BORDER=Orange

Created docker-compose.yaml
The compose file defines the csvserver service, exposes required ports, mounts input data, and loads environment variables.

Verified application startup   docker-compose up -d

Tested CSV Server
Verified output at:http://<public-ip>:9393
http://65.0.170.157:9393


Saved all required files under the solution/ directory
docker-compose.yaml,  csvserver.env , inputFile
 
Committed and pushed to GitHub
git add .
git commit -m "Completed Part-2: docker-compose setup"
git push
PART 2 COMPLETED
============================================================================
Part III – Prometheus Integration
Added Prometheus to monitor the csvserver container and graph the csvserver_records metric.

Steps Performed
Stopped and removed previous containers
docker-compose down

Added Prometheus container to docker-compose.yaml
The Prometheus service runs on port 9090 and mounts a configuration file.

Created prometheus.yml
Configured Prometheus to scrape metrics from:  csvserver:9300/metrics
 
Started both services:  docker-compose up -d

Verified CSV Server metrics endpoint
curl http://<public-ip>:9393/metrics
curl http://65.0.170.157:9393/metrics

Verified Prometheus UI
Accessed in browser at: http://<public-ip>:9090
http://65.0.170.157::9090

Queried the metric in Prometheus

Open Prometheus UI
In the query box type: csvserver_records
Click Execute
Switch to Graph tab
Observed a straight-line graph with value 7
Screenshots of UI attached with mail


Saved all files in solution folder
docker-compose.yaml
prometheus.yml
csvserver.env
inputFile

Committed and pushed the changes
git add .
git commit -m "Completed Part-3: Added Prometheus monitoring"
git push
PART 3 COMPLETED
============================================


