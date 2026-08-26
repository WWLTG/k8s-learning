#! Deployment Lab 02

# Deployment Updates and Rollouts

This lab is designed to practice updating an application running inside a:

Deployment

You will then monitor the update, inspect the:

ReplicaSet

revisions, create a failed update, and restore a previous version.

There is no ready-made solution included in this lab.

We do not use:

Git



# Lab Objectives

After completing this lab, you should be able to use:


kubectl rollout status
kubectl rollout history
kubectl rollout undo


You should also understand the following relationship:

text
Deployment update
1
New ReplicaSet
2
New Pods
3
Old ReplicaSet scaled down


