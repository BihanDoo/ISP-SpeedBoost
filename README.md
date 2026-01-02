# Speed Booster
### Is your ISP speed you up when running SpeedTest?  
Here is a simple Batch Script to run that speedtest for you (Again and again with brief intervals)  
so you don't have to touch anything, just sit back and do other work while the Bat handle the speed test  

----

The code (Batch script) is open source and you can change it to your requirements (I have put comments for you to understand what's happenning)  
However, the speedtest CLI is NOT open source and NOT affiliated in ANY kind with this project. it belongs to the respective owners



## Known Problems
SpeedTest have a limit. so, BE IN YOUR LIMIT.   
- choose an interval like `180 seconds` (3 minutes), `300 Seconds` (5 minutes) like so.  
- 5 minutes is almost enough for the service provider to slam open the bandwidth again :D
- After the limit reaches, speedtest process exits instantly (which the batch process end up waiting for the countdown to finish and start again)
