#!/bin/python

import sys
import os

file = sys.argv[1]

filename = file.split(".")[0]
filetype = file.split(".")[1]

types = {"java": f"javac {file} && java {filename}",
         "c": f"gcc {file} -o {filename}.out && ./{filename}.out",
         "cpp": f"g++ {file} -o {filename}.out && ./{filename}.out",
         }

os.system(types[filetype])
