# utils.sh

file containing the utils function for the project and other

* [generate_apt_list_ubuntu()](#generateaptlistubuntu)
* [checkWSL()](#checkwsl)
* [check_packages_install()](#checkpackagesinstall)
* [aptupdate()](#aptupdate)
* [aptupgrade()](#aptupgrade)
* [aptclean()](#aptclean)
* [check_args()](#checkargs)
* [check_root()](#checkroot)
* [check_root_func()](#checkrootfunc)
* [get_mimetype()](#getmimetype)
* [send_email()](#sendemail)
* [multiline_string_newline_to_array()](#multilinestringnewlinetoarray)
* [config_read_file()](#configreadfile)
* [config_get()](#configget)


## generate_apt_list_ubuntu()

change the source.list with template in /etc 

### Exit codes

* **0**: If successfull.
* **1**: On failure

## checkWSL()

check if the system is a WSL

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_packages_install()

check if the packages exist

### Arguments

* # @args $1 package name

### Exit codes

* **0**: If installed
* **1**: if not installed

## aptupdate()

apt-get update

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## aptupgrade()

apt-get upgrade all

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## aptclean()

apt-get autoclean

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_args()

check for args for a function

### Arguments

* # @args $@ args

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_root()

check if the user is root then execute the command 

### Arguments

* **$1** (a): bash command 

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_root_func()

check if the user is root then execute the bash func 

### Arguments

* **$1** (a): bash func

### Exit codes

* **0**: If successfull.
* **1**: On failure

## get_mimetype()

check mimetype of a file

### Arguments

* **$1** (file):

### Exit codes

* **0**: If successfull.
* **1**: On failure

## send_email()

send mail locally with heirloom-mailx

### Arguments

* **$1** (email): from
* **$2** (email): to
* **$3** (email): subject
* **$4** (email): body
* **$5** (email): attachement file

### Exit codes

* **0**: If successfull.
* **1**: On failure

## multiline_string_newline_to_array()

multiline string echo on each line with line number

### Arguments

* **$1** (multiline): string

### Exit codes

* **0**: If successfull.
* **1**: On failure

## config_read_file()

read config file
https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script

### Arguments

* **$1** (the): config fiel path

### Exit codes

* **0**: If successfull.
* **1**: On failure

## config_get()

get config var from a spefic file
https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script

### Arguments

* **$1** (the): config file path
* **$2** (the): config file var

### Exit codes

* **0**: If successfull.
* **1**: On failure

