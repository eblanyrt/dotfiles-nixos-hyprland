#!/bin/bash

sudo rmmod kvm_amd
sudo rmmod kvm
sudo lsmod | grep kvm
