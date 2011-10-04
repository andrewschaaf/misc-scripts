#!/usr/bin/env python

import sys, os, re
from subprocess import check_call


def pathsIn(root):
  if os.path.isfile(root):
    yield root
    return
  else:
    for (dirpath, dirnames, filenames) in os.walk(root):
      for filename in filenames:
        path = os.path.join(dirpath, filename)
        path = os.path.abspath(path)
        if not re.search(r"/\.", path):
          yield path

paths = []
for x in sys.argv[1:]:
  for path in pathsIn(x):
    if path.endswith(".png"):
      paths.append(path)

for path in paths:
  path2 = path + "-TEMP"
  check_call(["optipng", "-o7", path])
  check_call(["mv", path, path2])
  check_call(["bash", "-c", "cat '" + path2 + "' | png-guts --strip-text > '" + path + "'"])
  check_call(["rm", path2])
