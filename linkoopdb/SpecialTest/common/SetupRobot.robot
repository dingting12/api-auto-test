*** Settings ***
Library           SQLCliLibrary
Library           CompareLibrary
Library           SetupRobot.py
Library           OperatingSystem

*** Keywords ***
Setup Linkoop SQL Test
    Compare Ignore EmptyLine           True
    Compare Mask                       True
    Compare Skip                       Running.*
    Compare Break When Difference      True