#!/bin/bash

#############################################################################################
# 0. Check bash version and shell
echo "$SHELL"
bash --version

#############################################################################################
# 1. Piping and Redirection

cat ../LICENSE | less   # Sends the output to next command instead of std out.
ls > temp.txt   # Redirect the output to file
ls >> temp.txt  # Append the output instead of overwrite

# To redirect std output we can use 1 and for error we can use 2
ls /notreal 1>tempoutput.txt 2>temperror.txt

cat < temp.txt # Input redirection

# Here document for multiline string takes input until the limit string is encountered
cat << EndOfText
This is multi
Line String
EndOfText

#############################################################################################
# 2. Bash builtins and other commands

echo Some Text
printf "Some Text"

# Check if it's a command or builtin
command -V echo
command -V df

# builtins are preffered over commands
# To disable builtin 
enable -n echo
command -V echo

# To see disabled builtins
enable -n

# To reenable builtin
enable echo

# Get list of all builtins
help

#############################################################################################
# 3. Bash Expansions and Substitutions

#######################################
# Tilde ~ expansion represents the home directory
echo ~

# previous working directory
echo ~-

#######################################
# Brace {} expansion

echo b{a,o,i,e,u}t  # Prints everything by changing each value
echo {1..3} # Generates seq of numbers
echo {00..100} # numbers with 0 prefix
echo {1..30..3}
echo {Z..A}

# we can also use this for file paths where only one part of the path changes
mkdir temp
touch temp/temp_file_{1..4}{i..k}.txt

#######################################
# Parameter expansion ${...} is used to set value and retreive

GREETING="Hellow World"
echo $GREETING
echo ${GREETING}
echo ${GREETING:7}  # print starting at char 7
echo ${GREETING:7:3}  # print 3 chars starting at char 7

# Replace first occurence of pattern in variable
echo ${GREETING/World/People}

# Replace all occurences of pattern in variable
echo ${GREETING//l/_}

#######################################
# Command Substitution $(...) output of a command inside another command

echo "The Kernel release version is $(uname -r)"

#######################################
# Arithmetic Expansion $((...)) to do math.

echo $(( 2 + 2 ))
echo $(( 4 - 2 ))
echo $(( 5 / 2 )) # Only gives int
