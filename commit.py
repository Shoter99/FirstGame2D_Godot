import sys, os

try:
    msg = sys.argv[1]
    os.system(f'git add . && git commit -m "{msg}" && git push')
except Exception as e:
    print(e)

