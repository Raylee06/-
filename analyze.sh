cat > analyze.sh <<'EOF'
#!/bin/bash
CSV="$1"
if [ ! -f "$CSV" ];then
    echo "error: file $CSV does not exist" >&2
    exit 1
fi
echo "==== Top2 path with 5xx errors ===="
tail -n +2 "$CSV" | awk -F',' '$4 ~ /^5/ {print $3}' | sort | uniq -c | sort -k1,1nr -k2,2 | head -n 2
echo -e "\n==== Average latency_ms ===="
tail -n +2 "$CSV" | awk -F',' '{sum += $5; cnt++} END{printf "%.2f\n", sum/cnt}'
EOF
