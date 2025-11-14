# Part 1 - CSVServer Solution

### Commands executed:

1. Pull images:
   docker pull infracloudio/csvserver:latest
   docker pull prom/prometheus:v2.45.2

2. Tried running container:
   docker run -d --name csvsrv_test infracloudio/csvserver:latest

3. Found container failing because inputdata file missing.

4. Created CSV generator script:
   ./gencsv.sh 2 8

5. Generated inputFile with 7 entries.

6. Ran working container with inputFile mounted:
   docker run -d \
     --name csvserver \
     -v "$PWD/inputFile":/csvserver/inputdata \
     -p 9393:9300 \
     -e CSVSERVER_BORDER=Orange \
     infracloudio/csvserver:latest

7. Verified output:
   curl http://localhost:9393

### Required Files
- gencsv.sh
- inputFile
- part-1-cmd
- part-1-output
- part-1-logs

