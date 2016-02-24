import httplib
import time
import urllib2
import urllib
import json
import requests
import pexpect
import fileinput
import threading
import subprocess
import sys
import psutil
import os

SERVER_URL = "http://192.168.1.128"
SERVER_PORT = "3000"
MEDIA_FOLDER = "./arrow/media/"
NOT_CONNECTED_FILE = "/home/pi/arrow/static/notconnected.html"
NOT_REGISTERED_FILE = "/home/pi/arrow/static/notregistered.html"
GROUP_NOT_ASSIGNED_FILE = "/home/pi/arrow/static/nogroup.html"
PLAYLIST_NOT_ASSIGNED_FILE = "/home/pi/arrow/static/noplaylist.html"
DOWNLOADING_FILE = "/home/pi/arrow/static/downloading.html"
NO_DESIGN_FILE = "/home/pi/arrow/static/nodesign.html"
not_connected_browser_open = False
not_registered_browser_open = False
group_not_assigned_browser_open = False
no_design_browser_open = False
execute_flag = True


def do_every (interval, worker_func, iterations = 0):
  if iterations != 1:
    threading.Timer (
      interval,
      do_every, [interval, worker_func, 0 if iterations == 0 else iterations-1]
    ).start()
  worker_func()

def open_browser(file_path):
  link = "iceweasel --profile=fullscreen --url %s" % (file_path)
  iceweasel = subprocess.Popen(link)

def update_local_file(json,json_slot):
  print "updating local file"
  jsonFile = open("data.json", "r")
  data = json.load(jsonFile)
  jsonFile.close()
  print "opening data.json file"
  if json_slot == "pi":
    tmp = data["pi"]
    data["pi"] = json
    print "update pi stuff"
  elif json_slot == "group":
    print "update group stuff"
    tmp = data["group"]
    data["group"] = json
  elif json_slot == "playlist":
    tmp = data["playlist"]
    data["playlist"] = json
    print "update playlist stuff"
  jsonFile = open("data.json", "w+")
  jsonFile.write(json.dumps(data))
  jsonFile.close()
  print "Closing data.json file"

def kill_all_process():
  layout_name = "%s.sh" % (layout)
  for proc in psutil.process_iter():
    # check whether the process name matches
    if proc.name() == layout_name:
        proc.kill()
    if proc.name() == "iceweasel":
        proc.kill()
    if proc.name() == "omxplayer":
        proc.kill()

def delete_folder():
  print "deleted Folders"
  fileList = os.listdir(MEDIA_FOLDER)
  for fileName in fileList:
    os.remove(MEDIA_FOLDER+"/"+fileName)
  # layoutFileList = os.listdir(layoutFolder)
  # for fileName in layoutFileList:
  #   os.remove(layoutFolder+"/"+fileName)
  # # remove media folder content
  # remove layout folder content
  print "removed video content"

def read_local_file():
  with open('data.json') as data_file:
    global data
    data = json.load(data_file)

def update_videos():
  for video_url in playlist["playlist"]["videos"]:   
        print video_url["movie_url"]
        movie_url = "%s:%s%s" % (SERVER_URL,SERVER_PORT,video_url["movie_url"])
        path = "%s%s" % (MEDIA_FOLDER,video_url["movie_file_name"])
        wget.download(movie_url, path)

def execute():
  if execute_flag:
    if layout == "a":
      omxplayer = subprocess.Popen("./a.sh")
      link = "iceweasel --profile=fullscreen --url http://%s:%s/designs/%s" % (SERVER_URL,SERVER_PORT,design["id"])
      iceweasel = subprocess.Popen(link)
    elif layout == "b":
      omxplayer = subprocess.Popen("./b.sh")
    elif layout == "c":
      omxplayer = subprocess.Popen("./c.sh")
      link = "iceweasel --profile=fullscreen --url http://%s:%s/designs/%s" % (SERVER_URL,SERVER_PORT,design["id"])
      iceweasel = subprocess.Popen(link)
    elif layout == "d":
      omxplayer = subprocess.Popen("./d.sh")
      link = "iceweasel --profile=fullscreen --url http://%s:%s/designs/%s" % (SERVER_URL,SERVER_PORT,design["id"])
      iceweasel = subprocess.Popen(link)
    elif layout == "e":
      link = "iceweasel --profile=fullscreen --url http://%s:%s/designs/%s" % (SERVER_URL,SERVER_PORT,design["id"])
      iceweasel = subprocess.Popen(link)

def get_design():
  read_local_file()
  design_id = playlist["design_id"]
  if design_id != "null":
    u = "%s:%s/designs/%s.json" % (SERVER_URL,SERVER_PORT,design_id)
    response = requests.get(u)
    global design
    design = response.json()
    print design
    global layout
    layout = design["layout_type"]
  else:
    if no_design_browser_open == False:
      open_browser(NO_DESIGN_FILE)
      no_design_browser_open = True

def get_playlist():
  read_local_file()  
  playlist_id = group["playlist_id"]
  if playlist_id != "null":
    u = "%s:%s/playlists/%s.json" % (SERVER_URL,SERVER_PORT,playlist_id)
    response = requests.get(u)
    global playlist
    playlist = response.json()
    print playlist
    version = data["playlist"]["version"]
    if playlist["id"] == playlist_id:
      if playlist["version"] > data["playlist"]["version"]:
        kill_all_process()
        open_browser(Downloading_FILE)
        delete_videos()
        update_videos()
        execute_flag = True
        update_local_file(playlist, "playlist")
        kill_all_process()
        get_design()
      else:
        get_design()
    else:
  else:
    if playlist_not_assigned_browser_open == False:
      open_browser(PLAYLIST_NOT_ASSIGNED_FILE)
      playlist_not_assigned_browser_open = True
      print "No Playlist assigned to the group."


def check_group():
  read_local_file()
  group_id = data["pi"]["group_id"]
  if group_id != "null":
    u = "%s:%s/groups/%s.json" % (SERVER_URL,SERVER_PORT,str(group_id))
    response = requests.get(u)
    global group
    group = response.json()
    print group
    updated_at = data["group"]["updated_at"]
    count = data["group"]["count"]
    if group["id"] == group_id:
      if group["count"] > data["group"]["count"]: #time.strptime(group["updated_at"], "%d %b %y") > time.strptime(updated_at, "%d %b %y"):
        get_playlist()
        update_local_file(group, "group")
      else:
        print "No Need to update. Already Updated"
        get_playlist()
    else:
      update_local_file(group, "group")
      get_playlist()
  else:
    if group_not_assigned_browser_open == False:
      open_browser(GROUP_NOT_ASSIGNED_FILE)
      group_not_assigned_browser_open = True
      print "group Not registered"

def check_registration():
  read_local_file()
  global data
  pi_uuid = data["pi"]["uuid"]
  u = "%s:%s/pis.json?uuid=%s" % (SERVER_URL,SERVER_PORT,client_uuid)
  response = requests.get(u)
  pi = response.json()
  print pi
  if response.header == "200": # check header for success info
    update_local_file(pi, "pi")
    check_group()
  else
    if not_registered_browser_open == False:
      open_browser(NOT_REGISTERED_FILE)
      not_registered_browser_open = True

def ping_status():
  print "checking ping status"
  response = os.system("ping -c 1 -w2 " + SERVER_URL + " > /dev/null 2>&1")
  if response:
    print "Checking Registration"
    check_registration()
  else:
    print "Not Connected Opening Browser with Current status, Ip, and Registration no."
    # TODO: if disconnected after starting then what?
    if not_connected_browser_open == False: # If browser is already open don't open another.
      open_browser(NOT_CONNECTED_FILE)
      not_connected_browser_open = True
