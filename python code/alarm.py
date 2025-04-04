import time  
import winsound  # Windows only, use other libraries for Linux/Mac  

def set_alarm(seconds):  
    print(f"Alarm set for {seconds} seconds from now...")  
    time.sleep(seconds)  
    winsound.Beep(1000, 2000)  # Beeps for 2 seconds  

set_alarm(10)  # Example: Alarm after 10 seconds  
