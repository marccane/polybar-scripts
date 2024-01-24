#!/bin/python3
import json
import urllib.request

def zin(n): #zero if None
	return 0 if n is None else n
import sys
ip=sys.argv[1]
url="http://"+ip+"/solar_api/v1/GetPowerFlowRealtimeData.fcgi"
try:
	contents = urllib.request.urlopen(url).read()
	root = json.loads(contents)
	site = root["Body"]["Data"]["Site"]

	pv, pgrid, pload, scons, autonomy = site["P_PV"], site["P_Grid"], site["P_Load"], site["rel_SelfConsumption"], site["rel_Autonomy"]
	pv, pgrid, pload, scons, autonomy = zin(pv), zin(pgrid), zin(pload), zin(scons), zin(autonomy)
	pv, pgrid, pload, scons, autonomy = int(pv), float(pgrid), float(pload), float(scons), float(autonomy)
	pload = abs(pload)
	#feed =  #"regalem", no es trivial de calcular

	# generat consumit %autonomy
	print("PV %dW %.1fW %.1f%%" % (pv, pload, autonomy))
except: 
	print("Error")
