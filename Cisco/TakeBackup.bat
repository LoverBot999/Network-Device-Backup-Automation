@ECHO OFF
color  0A
Title "Manual Daily Device Backup Activity - Coded By Pritam"

::For getting date in spesific format (08-10-2019 DD-MM-YYYY) we will use below variable
set DD-MM-YYYY="%Date:~7,2%-%Date:~4,2%-%Date:~10,4%"

::Then we will create current date folder inside Log folder
mkdir Log\%DD-MM-YYYY%


::Below cmd accept username
set /p UName=Enter Your Username:
echo Welcome " %UName%

::Below cmd accept password
set / Passwd=Please Enter Your Password:

echo "have a patient script is running"


pause 5 | FOR /f "delims=" %%G IN (DeviceIP.txt) DO plink.exe -ssh %UName%@%%G -pw %Passwd% -m cmd.txt >> Log\%DD-MM-YYYY%\%%G.txt

::Above cmd loop through all IP's mentioned in DeviceIP.txt
::And then login via plink.exe using ssh protocol and executes commands mentioned in the cmd.txt
::After that copy whole output into latest date directory mentioned in the Log\ directory with the name of Device IP.txt


echo "--------------------Script Ends--------------------"
