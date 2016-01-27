#!/usr/bin/env python

import sys
from sys import *
from itertools import islice
#from sets import Set
import time
import re


def load_doc(document):
	doc=open(document, 'r')
	word2freq={}
	for line in doc:
		for word in line.strip().split():
			if not word2freq.has_key(word):
				word2freq[word] = 1;
			else:
				word2freq[word] += 1;
	return word2freq
def replaceRareWords(document, dictionary):
	doc=open(document, 'r')
	for line in doc:
                for word in line.strip().split():
			if word.isdigit():
				for a in range (0,3):
					sys.stdout.write("0")
				sys.stdout.write(" ")
			else:
				if (dictionary[word]<5):
					sys.stdout.write("<unk> ")
				else:
					sys.stdout.write("%s " %(word))
		print

corpus	= argv[1]
w2f=load_doc(corpus);

replaceRareWords(corpus, w2f)
#w2f_view = [ (v,k) for k,v in w2f.iteritems() ]
#w2f_view.sort(reverse=True) 
#windex=1




#for v,k in w2f_view:
#	print "%d %s %d" % (windex,k,v)
#	windex+=1


