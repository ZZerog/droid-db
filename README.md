# droid-db

Simple shell script to download Android SQLite database to your computer using a few `adb` commands. Based on: https://stackoverflow.com/a/12914297/314055

##### Usage

* droid-db-copy.sh - cmd line tool. Inputs are Android app. package and database name.
* droid-sql.sh - fill-up the headers (package and database) variables , copy script into a root directory of your android project, open a terminal (alt-F12) in the Android Studio and just write ./droid-db.sh. The result will by fresh copy of database and a sqlite prompt.

![result](https://github.com/ZZerog/droid-db/blob/img/screen.png?raw=true)
