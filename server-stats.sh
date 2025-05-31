#!/bin/sh  # ← Uses the basic system shell
echo "This will run in whatever /bin/sh points to"

echo "----- BASIC SERVER STATS -----"
echo "Run date: $(date)"
echo ""

# CPU
echo "CPU:"
top -bn1 | grep "Cpu(s)" | awk '{print "Usage: " 100-$8 "%"}'
echo ""

# Memory
echo "MEMORY:"
free -m | grep "Mem:" | awk '{print "Total: "$2"MB, Used: "$3"MB, Free: "$4"MB ("$3/$2*100"%)"}'
echo ""

# Disk
echo "DISK:"
df -h / | tail -1 | awk '{print "Total: "$2", Used: "$3", Free: "$4", Usage: "$5}'
echo ""

# Top CPU
echo "TOP CPU PROCESSES:"
ps -eo pid,user,pcpu,comm --sort=-pcpu | head -6
echo ""

# Top Memory
echo "TOP MEMORY PROCESSES:"
ps -eo pid,user,pmem,comm --sort=-pmem | head -6
echo ""

echo "----- DONE -----"
