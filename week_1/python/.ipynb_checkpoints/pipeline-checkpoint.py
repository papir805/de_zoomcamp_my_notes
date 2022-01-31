import sys

import pandas as pd 

print(sys.argv)

if len(sys.argv) > 1:
    day = sys.argv[1]
    print(F"job successfully completed for day = {day}.")
else:
    print("job successfully completed.")