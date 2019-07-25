`echo "Waiting for both databases to be up..."`
(1..60).each do
  oracle_db   = `echo exit | telnet localhost 1522`.scan(/Connected to localhost/).any?
  postgres_db = `echo exit | telnet localhost 5433`.scan(/Connected to localhost/).any?

  if oracle_db && postgres_db
    `echo "Both databases are up !!"`
    break
  else
    sleep 5
  end
end