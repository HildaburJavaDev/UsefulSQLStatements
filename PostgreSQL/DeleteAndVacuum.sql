CREATE OR REPLACE FUNCTION delete_old_records()
RETURNS void AS $$
BEGIN
DELETE FROM "event"
WHERE "date" < NOW() - INTERVAL '14 days';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION vacuum_event_table()
RETURNS void AS $$
BEGIN
perform 'VACUUM (VERBOSE, ANALYZE) event';
END;
$$ LANGUAGE plpgsql;
