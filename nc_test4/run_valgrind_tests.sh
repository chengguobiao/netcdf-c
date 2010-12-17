#!/bin/sh

# This shell runs the tests with valgrind.

# $Id: run_valgrind_tests.sh,v 1.9 2010/01/26 20:24:18 ed Exp $

set -e
echo ""
echo "Testing programs with valgrind..."

# These are my test programs.
list="t_type tst_camrun tst_vl tst_v2 tst_vars2 \
tst_atts2 tst_files2 tst_files"
# If we are running with netcdf4, then add tst_atts
if test "x$USE_NETCDF4" = "x1" ; then
list="$list tst_atts"
fi

for tst in $list; do
    echo ""
    echo "Memory testing with $tst:"
    valgrind -q --error-exitcode=2 --leak-check=full ./$tst
done

echo "SUCCESS!!!"

exit 0
