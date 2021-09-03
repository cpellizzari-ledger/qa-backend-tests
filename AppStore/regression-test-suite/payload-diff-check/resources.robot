*** Settings ***
Documentation     Resource file for the appstore diff test suite
Library           RobotLibraries

*** Variables ***
${OLD ENDPOINT}      https://appstore-k8s.staging.aws.ledger.fr/
${NEW ENDPOINT}      https://appstore-k8s.aws.ledger.fr/