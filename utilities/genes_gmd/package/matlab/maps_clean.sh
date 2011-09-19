#!/bin/sh
# ---------------------------------------------------------------------------- #
# maps_clean.sh   : clean up files generated by maps_extract.sh                #
#                                                                              #
# usage: maps_clean.sh dir_1 dir_2                                             #
#                                                                              #
#                                      Author      : Hendrik L. Tolman         #
#                                                                              #
# 06-Oct-2009 : Origination.                                                   #
#                                                                              #
# ---------------------------------------------------------------------------- #
# 1. Initialization

  set -e

  echo ' '
  echo 'maps_clean.sh :'
  echo '---------------'

  if [ "$#" -lt "2" ] ; then
    echo "   No directories defined (abort)" ; exit 1 ; fi

  dir_1=$1
  dir_2=$2

  setup='.genes.env'

# ---------------------------------------------------------------------------- #
# 2. Get setting for running script

  if [ -f ~/$setup ]
  then
    echo "   Setup file $setup found."
    . ~/$setup
  else
    echo "   Setup file $setup NOT found (abort)."
    exit 1
  fi

  if [ ! -d $genes_data/$dir_1/$dir_2 ] ; then
    echo "   Directory $genes_data/$dir_1/$dir_2 not found (abort)" 
    exit 2 ; fi

  data_dir=$genes_data/$dir_1/$dir_2
  echo "   Data directory has been found :"
  echo "      $genes_data/$data_dir"

  cd $data_dir

# ---------------------------------------------------------------------------- #
# 3.  Removing files

  for ext in count lambda mu Dtheta Cd Cs m n
  do
    rm -f maps.$ext
  done

# ---------------------------------------------------------------------------- #
# 4. End of script

  echo ' '
  echo 'End of maps_clean.sh' 

# End of maps_clean.sh ------------------------------------------------------- #
