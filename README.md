# NTPforCuba

## Description
NTPforCuba is a simple script designed to synchronize the system time with Cuban time using Google's NTP servers via HTTP proxy. This script automates the process of adjusting the system time to ensure it accurately reflects the current time in Cuba.

## Prerequisites
Before using this script, ensure you have the following:
- Linux environment
- Access to a proxy server for HTTP connections
- Proper permissions to execute the script

## Usage
1. Clone this repository to your local machine:
git clone https://github.com/yourusername/NTPforCuba.git
2. Navigate to the cloned directory:
cd NTPforCuba
3. Ensure the script has the necessary permissions to execute:
chmod +x setDate.sh
4. Run the script:
./setDate.sh

## Setting Up Cron Job
To automate the synchronization process, you can set up a cron job to run the script at regular intervals. Here's how to do it:

1. Open your crontab file for editing:
nano /etc/crontab
2. Add the following line to the file to run the script every minute:
* * * * * root bash /path/to/setDate.sh
Replace `/path/to/NTPforCuba.sh` with the actual path to your script.

3. Save and close the crontab file.

Now, the script will be executed every minute, ensuring your system time stays synchronized with Cuban time.

## Disclaimer
Please note that the accuracy of time synchronization heavily relies on the availability and reliability of Google's NTP servers and the provided HTTP proxy. Use this script at your own discretion.

## License
This project is licensed under the MIT License. Feel free to modify and distribute it as per the terms of the license.
See LICENSE.txt for more information.

For any questions or issues, please open an [issue](https://github.com/kaelthasmanu/NTPforCuba/issues) on GitHub. Contributions are welcome!


