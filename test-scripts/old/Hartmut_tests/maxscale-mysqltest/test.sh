#! /bin/sh

TESTS="t/test_transaction_routing1.test \
        t/test_transaction_routing2.test \
        t/test_transaction_routing2b.test \
        t/test_transaction_routing3.test \
        t/test_transaction_routing3b.test \
        t/test_transaction_routing4.test \
        t/test_transaction_routing4b.test t/select_for_var_set.test \
        t/test_implicit_commit1.test t/test_implicit_commit2.test \
        t/test_implicit_commit3.test t/test_implicit_commit4.test \
        t/test_implicit_commit5.test t/test_implicit_commit6.test \
        t/test_implicit_commit7.test t/test_autocommit_disabled1.test \
        t/test_autocommit_disabled1b.test \
        t/test_autocommit_disabled2.test \
        t/test_autocommit_disabled3.test \
        t/set_autocommit_disabled.test \
        t/test_after_autocommit_disabled.test t/test_sescmd.test"

#TESTS="t/test_sescmd.test"

cat "PASSED" > fail.txt
for i in $(seq 10); do
  echo
  echo "Test run #$i"
  echo "============"
  for test in $TESTS; do
    echo -n "testing $test: "
    ./mysqltest_driver.sh . 127.0.0.1 4006 maxuser maxpwd 2 $test 
    if [ "$?" == 0 ] ; then
	echo "PASSED" 
    else 
	echo "FAILED"
        echo "FAILED" >> fail.txt
    fi
  done
done
