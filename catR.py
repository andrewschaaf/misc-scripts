#!/usr/bin/env python

import os, sys, re


def pathsIn(root):
  for (dirpath, dirnames, filenames) in os.walk(root):
    for filename in filenames:
      yield "%s/%s" % (dirpath, filename)


for path in pathsIn(sys.argv[1]):
  if not re.search(r'/\.', path):
    with open(path, 'rb') as f:
      sys.stdout.write(f.read())
