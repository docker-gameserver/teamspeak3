# Voice Server: Teamspeak 3

This is a Docker image to run a [TeamSpeak 3](http://www.teamspeak.com/) server.

- The database and files/logs  are stored in a persistent storage folder `/data`.
- If non-existent, these files/folders are also created directly in the persistent storage folder.

--------

## Running the image

In order to run the TeamSpeak 3 Server, use the following:

```sh
docker run -d --restart=unless-stopped --name=ts3server -p 9987:9987/udp -v {FOLDER}:/data gameserver/teamspeak3
```

If you want to use file uploads and the server query interface, you will need to publish the following ports too. `-p 30033:30033 -p 10011:10011`

You can also use different port(s) if you want.  You can keep the default built-in ports inside the container and just map them to different ports on the host, e.g.:
`-p 9988:9987/udp -p 30034:30033 -p 10012:10011`

--------

## First Run

If no database exist in the persistent storage folder, a new database will be created. Make sure you check the logfile, using the following command:

```sh
docker logs ts3server
```

You will need your randomized ServerAdmin password/token to manage your new server. These are found in the log file on first run:
```
------------------------------------------------------------------
                      I M P O R T A N T
------------------------------------------------------------------
               Server Query Admin Account created
         loginname= "serveradmin", password= "superSecret"
------------------------------------------------------------------
```
[...]
```
------------------------------------------------------------------
                      I M P O R T A N T
------------------------------------------------------------------
      ServerAdmin privilege key created, please use it to gain
      serveradmin rights for your virtualserver. please
      also check the doc/privilegekey_guide.txt for details.

       token=superSecret
------------------------------------------------------------------
```
**Write them down for later use.**

--------

## Upgrading

Since the config/data files should be stored in the persistent storage folder, just pull the newer image from Docker Hub, then stop/remove the container and create it again:

```sh
docker pull gameserver/teamspeak3
docker stop ts3server
docker rm ts3server
docker run --restart=unless-stopped --name=ts3server -d -p 9987:9987/udp -v {FOLDER}:/data gameserver/teamspeak3
```

## License

Released under the [MIT license](./LICENSE).