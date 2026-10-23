# config with every line of config.changes in place of the line of its symbol: awk -f merge-config.awk config.changes config
function sym(l,   t) {
    t = l; gsub(/^[ \t]+|[ \t]+$/, "", t)
    if (t ~ /^# CONFIG_.* is not set$/) { sub(/^# CONFIG_/, "", t); sub(/ is not set$/, "", t); return t }
    if (t ~ /^CONFIG_[^=]*=/) { sub(/^CONFIG_/, "", t); sub(/=.*/, "", t); return t }
    return ""
}
NR == FNR { s = sym($0); if (s != "") { named[s] = 1; added[++n] = $0 }; next }
{ s = sym($0); if (s == "" || !(s in named)) print }
END { for (i = 1; i <= n; i++) print added[i] }
