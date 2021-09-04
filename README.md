# 🤖 QA tests - API

A collection of tests that aim to check for consistency across API versions

## Set up

_NB : To determine your version of python by default, run_

`foo@bar:~$ python --version`

_If the output is_ `Python 2.x.x`, _please adjust your commands accordingly :_

`python => python3`

`pip => pip3`


    # Navigate to test dir
    foo@bar:~$ cd qa-backend-tests

    # Create new virtual env
    foo@bar:~$ virtualenv qa-ledger
    foo@bar:~$ source qa-ledger/bin/activate

    # Install requirements
    foo@bar:~$ pip3 install -r requirements.txt

    # Make the Robot libraries visible to python
    foo@bar:~$ export PYTHONPATH="${PYTHONPATH}:{/path/to/your/directory}/qa-backend-tests/RobotLibraries"

## Running Robot tests
![enter image description here](https://camo.githubusercontent.com/59f01d91e0ac4c30359b6b89303d72aaa52cd7bcdd9d1d814cd9a5f6ed31baf1/687474703a2f2f7777772e64616564746563682e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031322f31322f54657374416c6c5468655468696e67732e6a7067)

   

 1. Creating a directory for the test reports

    `cd qa-backend-tests && mkdir reports`

 2. Run the tests with the following command : 
 
	  **`robot -T -d reports -n noncritical .`**

### Quick Explanation of Switches Shown

-   **`-T`**  - Short for  **`--timestampoutputs`**. Creates reports, logs, etc. with the current timestamp so we don't overwrite existing ones upon execution.
-   **`-d`**  - Short for  **`--outputdir`**. Tells the framework where to create the report files.
-   **`-n`**  - Short for  **`--noncritical`**. This tells Robot Framework what tag indicates a non-critical test (I've standardized on  `noncritical`  to reduce ambiguity).

### Additional documentation

 - Robot Framework website [here](https://robotframework.org/)
 - Robot User Guide documentation [here](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
 - Robot's public API documentation (used to write custom libraries) [here](https://robot-framework.readthedocs.io/en/latest/)
