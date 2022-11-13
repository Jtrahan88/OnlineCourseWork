-- Keep a log of any SQL queries you execute as you solve the mystery.
-- What we know so far:
-- 1) theft took place on July 28, 2021 - on Humphrey Street @ 10:15am
-- 2) 3 interviews given that all mention bakery same day
-- 3) Thief left bakery parking lot between 10:15am - 10:25am
-- 4) Thief withdrew money same day as crime but before on Leggett Street
-- 5) Thief called someone talked less than a minute, about the EARLIEST flight out of Fiftyville tomorrow (7/29/2021). Other person on teh phone bought the ticket
-- 6)

-- All we know is that the theft took place on July 28, 2021 and that it took place on Humphrey Street. Crime took place at 10:15am
SELECT *
FROM crime_scene_reports
WHERE year = 2021
    AND month = 7
    AND day = 28
    AND description LIKE '%Humphrey Street%';

-- The crime report shows that 3 interviews were given. All on the same day where teh transcript all mention the bakery

SELECT *
FROM interviews
WHERE transcript LIKE '%bakery%'
    AND year = 2021
    AND month = 7
    AND day = 28;

-- From each of the 3 witness statement the following was checked:

-- 1) The thief left the bakery parking lot within 10 mins of the theft. Check the secruity logs BETWEEN  10:15am - 10:25am
-- Run license plates:
SELECT *
FROM people
WHERE license_plate IN (SELECT license_plate
                        FROM bakery_security_logs
                        WHERE hour = 10
                            AND minute BETWEEN 15 AND 25
                            AND year = 2021
                            AND month = 7
                            AND day = 28);
-- +--------+---------+----------------+-----------------+---------------+
-- |   id   |  name   |  phone_number  | passport_number | license_plate |
-- +--------+---------+----------------+-----------------+---------------+
-- | 221103 | Vanessa | (725) 555-4692 | 2963008352      | 5P2BI95       |
-- | 243696 | Barry   | (301) 555-4174 | 7526138472      | 6P58WS2       |
-- | 396669 | Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       |
-- | 398010 | Sofia   | (130) 555-0289 | 1695452385      | G412CB7       |
-- | 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       |
-- | 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       |
-- | 560886 | Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       |
-- | 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       |
-- +--------+---------+----------------+-----------------+---------------+

-- check passport numbers with flights, and check lincense plates ********************


-- 2) Thief was withdrew money before the crime SAME DAY. Check ATM WITHDRAWS money on Leggett Street
-- check account numbers with bank accounts and people 7/28/2021.
SELECT p.name, p.passport_number, p.license_plate, ba.account_number, atm.year, atm.month, atm.day, atm.transaction_type, atm.amount
  FROM bank_accounts AS ba
JOIN atm_transactions AS atm
  ON atm.account_number = ba.account_number
JOIN people as p
  ON p.id = ba.person_id
WHERE transaction_type = 'withdraw'
  AND atm.account_number IN (SELECT account_number
                FROM atm_transactions
                WHERE year = 2021
                    AND month = 7
                    AND day = 28
                    AND transaction_type = 'withdraw'
                    AND atm_location =  'Leggett Street')
  AND year = 2021
  AND month = 7
  AND day = 28;
-- +---------+-----------------+---------------+----------------+------+-------+-----+------------------+--------+
-- |  name   | passport_number | license_plate | account_number | year | month | day | transaction_type | amount |
-- +---------+-----------------+---------------+----------------+------+-------+-----+------------------+--------+
-- | Bruce   | 5773159633      | 94KL13X       | 49610011       | 2021 | 7     | 28  | withdraw         | 50     |
-- | Diana   | 3592750733      | 322W7JE       | 26013199       | 2021 | 7     | 28  | withdraw         | 35     |
-- | Brooke  | 4408372428      | QX4YZN3       | 16153065       | 2021 | 7     | 28  | withdraw         | 80     |
-- | Kenny   | 9878712108      | 30G67EN       | 28296815       | 2021 | 7     | 28  | withdraw         | 20     |
-- | Iman    | 7049073643      | L93JTIZ       | 25506511       | 2021 | 7     | 28  | withdraw         | 20     |
-- | Luca    | 8496433585      | 4328GD8       | 28500762       | 2021 | 7     | 28  | withdraw         | 48     |
-- | Taylor  | 1988161715      | 1106N58       | 76054385       | 2021 | 7     | 28  | withdraw         | 60     |
-- | Benista | 9586786673      | 8X428L0       | 81061156       | 2021 | 7     | 28  | withdraw         | 30     |
-- +---------+-----------------+---------------+----------------+------+-------+-----+------------------+--------+

-- check liencse plates who was at the crime AND with those who witdrew money on Leggett Street.
SELECT p.name, p.passport_number, p.license_plate, ba.account_number, atm.year, atm.month, atm.day, atm.transaction_type, atm.amount
  FROM bank_accounts AS ba
JOIN atm_transactions AS atm
  ON atm.account_number = ba.account_number
JOIN people as p
  ON p.id = ba.person_id
WHERE transaction_type = 'withdraw'
  AND atm.account_number IN (SELECT account_number
                FROM atm_transactions
                WHERE year = 2021
                    AND month = 7
                    AND day = 28
                    AND transaction_type = 'withdraw'
                    AND atm_location =  'Leggett Street')
  AND year = 2021
  AND month = 7
  AND day = 28
  AND p.license_plate IN (SELECT license_plate
                        FROM bakery_security_logs
                        WHERE hour = 10
                            AND minute BETWEEN 15 AND 25
                            AND year = 2021
                            AND month = 7
                            AND day = 28);
-- +-------+-----------------+---------------+----------------+------+-------+-----+------------------+--------+
-- | name  | passport_number | license_plate | account_number | year | month | day | transaction_type | amount |
-- +-------+-----------------+---------------+----------------+------+-------+-----+------------------+--------+
-- | Bruce | 5773159633      | 94KL13X       | 49610011       | 2021 | 7     | 28  | withdraw         | 50     |
-- | Diana | 3592750733      | 322W7JE       | 26013199       | 2021 | 7     | 28  | withdraw         | 35     |
-- | Iman  | 7049073643      | L93JTIZ       | 25506511       | 2021 | 7     | 28  | withdraw         | 20     |
-- | Luca  | 8496433585      | 4328GD8       | 28500762       | 2021 | 7     | 28  | withdraw         | 48     |
-- +-------+-----------------+---------------+----------------+------+-------+-----+------------------+--------+

-- 3) A Thief Called someone who talked to them for LESS THAN A MINUTE. In the call. thief said planning to take the EARLIEST flight out of Fiftyville tomorrow (7/29/2021).
-- The person on the other end of the phone to purchased the flight ticket.

-- the calls under 60 secs to get callers and receviers phone numbers
SELECT ppl.name, pc.caller, pc.receiver, ppl.phone_number,pc.duration, ppl.passport_number, ppl.license_plate
FROM phone_calls AS pc
JOIN people AS ppl
ON ppl.phone_number = pc.caller
WHERE year = 2021
    AND month = 7
    AND day = 28
    AND duration < 60;
-- +---------+----------------+----------------+----------------+----------+-----------------+---------------+
-- |  name   |     caller     |    receiver    |  phone_number  | duration | passport_number | license_plate |
-- +---------+----------------+----------------+----------------+----------+-----------------+---------------+
-- | Sofia   | (130) 555-0289 | (996) 555-8899 | (130) 555-0289 | 51       | 1695452385      | G412CB7       |
-- | Kelsey  | (499) 555-9472 | (892) 555-8872 | (499) 555-9472 | 36       | 8294398571      | 0NTHK55       |
-- | Bruce   | (367) 555-5533 | (375) 555-8161 | (367) 555-5533 | 45       | 5773159633      | 94KL13X       |
-- | Kelsey  | (499) 555-9472 | (717) 555-1342 | (499) 555-9472 | 50       | 8294398571      | 0NTHK55       |
-- | Taylor  | (286) 555-6063 | (676) 555-6554 | (286) 555-6063 | 43       | 1988161715      | 1106N58       |
-- | Diana   | (770) 555-1861 | (725) 555-3243 | (770) 555-1861 | 49       | 3592750733      | 322W7JE       |
-- | Carina  | (031) 555-6622 | (910) 555-3251 | (031) 555-6622 | 38       | 9628244268      | Q12B3Z3       |
-- | Kenny   | (826) 555-1652 | (066) 555-9701 | (826) 555-1652 | 55       | 9878712108      | 30G67EN       |
-- | Benista | (338) 555-6650 | (704) 555-2131 | (338) 555-6650 | 54       | 9586786673      | 8X428L0       |
-- +---------+----------------+----------------+----------------+----------+-----------------+---------------+

-- Now that we have the callers. lets see who was at the scene of the crime and withdrew money on Leggett Street:
SELECT ppl.name, pc.caller,pc.receiver,pc.duration, ppl.passport_number, ppl.license_plate
FROM phone_calls AS pc
JOIN people AS ppl
ON ppl.phone_number = pc.caller
WHERE year = 2021
    AND month = 7
    AND day = 28
    AND duration < 60
    AND ppl.license_plate IN (SELECT p.license_plate
                                FROM bank_accounts AS ba
                                JOIN atm_transactions AS atm
                                  ON atm.account_number = ba.account_number
                                JOIN people as p
                                  ON p.id = ba.person_id
                                WHERE transaction_type = 'withdraw'
                                  AND atm.account_number IN (SELECT account_number
                                                            FROM atm_transactions
                                                            WHERE year = 2021
                                                                AND month = 7
                                                                AND day = 28
                                                                AND transaction_type = 'withdraw'
                                                                AND atm_location =  'Leggett Street')
                                  AND year = 2021
                                  AND month = 7
                                  AND day = 28
                                  AND p.license_plate IN (SELECT license_plate
                                                          FROM bakery_security_logs
                                                          WHERE hour = 10
                                                              AND minute BETWEEN 15 AND 25
                                                              AND year = 2021
                                                              AND month = 7
                                                              AND day = 28));
-- Thief suspects
-- +-------+----------------+----------------+----------+-----------------+---------------+
-- | name  |     caller     |    receiver    | duration | passport_number | license_plate |
-- +-------+----------------+----------------+----------+-----------------+---------------+
-- | Bruce | (367) 555-5533 | (375) 555-8161 | 45       | 5773159633      | 94KL13X       |
-- | Diana | (770) 555-1861 | (725) 555-3243 | 49       | 3592750733      | 322W7JE       |
-- +-------+----------------+----------------+----------+-----------------+---------------+

-- who received the call?
SELECT name, phone_number, passport_number, license_plate, pc.duration
FROM people AS p
JOIN phone_calls AS pc
ON p.phone_number = pc.receiver
WHERE pc.duration < 60
AND pc.receiver IN (SELECT pc.receiver
                        FROM phone_calls AS pc
                        JOIN people AS ppl
                        ON ppl.phone_number = pc.caller
                        WHERE year = 2021
                            AND month = 7
                            AND day = 28
                            AND duration < 60
                            AND ppl.license_plate IN (SELECT p.license_plate
                                                        FROM bank_accounts AS ba
                                                        JOIN atm_transactions AS atm
                                                        ON atm.account_number = ba.account_number
                                                        JOIN people as p
                                                        ON p.id = ba.person_id
                                                        WHERE transaction_type = 'withdraw'
                                                        AND atm.account_number IN (SELECT account_number
                                                                                    FROM atm_transactions
                                                                                    WHERE year = 2021
                                                                                        AND month = 7
                                                                                        AND day = 28
                                                                                        AND transaction_type = 'withdraw'
                                                                                        AND atm_location =  'Leggett Street')
                                                        AND year = 2021
                                                        AND month = 7
                                                        AND day = 28
                                                        AND p.license_plate IN (SELECT license_plate
                                                                                FROM bakery_security_logs
                                                                                WHERE hour = 10
                                                                                    AND minute BETWEEN 15 AND 25
                                                                                    AND year = 2021
                                                                                    AND month = 7
                                                                                    AND day = 28)));

-- accomplise suspects
-- +--------+----------------+-----------------+---------------+----------+
-- |  name  |  phone_number  | passport_number | license_plate | duration |
-- +--------+----------------+-----------------+---------------+----------+
-- | Robin  | (375) 555-8161 |                 | 4V16VO0       | 45       |
-- | Philip | (725) 555-3243 | 3391710505      | GW362R6       | 49       |
-- +--------+----------------+-----------------+---------------+----------+

-- Earliest flights out of Fiftyville on (7/29/2021):
SELECT *
FROM flights
WHERE year = 2021
    AND month = 7
    AND day = 29
    ORDER BY hour
    LIMIT 1;
-- +----+-------------------+------------------------+------+-------+-----+------+--------+
-- | id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
-- +----+-------------------+------------------------+------+-------+-----+------+--------+
-- | 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
-- +----+-------------------+------------------------+------+-------+-----+------+--------+

-- Check passengers passports on that eailest flight agaisnt suspects:
SELECT ppl.name, ppl.phone_number, ppl.passport_number, ppl.license_plate , f.origin_airport_id, f.destination_airport_id
  FROM passengers AS p
JOIN people AS ppl
  ON ppl.passport_number = p.passport_number
JOIN flights AS f
  ON f.id = p.flight_id
WHERE f.id = (SELECT id
                FROM flights
                WHERE year = 2021
                    AND month = 7
                    AND day = 29
                    ORDER BY hour
                    LIMIT 1)
AND ppl.passport_number IN (SELECT ppl.passport_number
                                FROM phone_calls AS pc
                                JOIN people AS ppl
                                ON ppl.phone_number = pc.caller
                                WHERE year = 2021
                                    AND month = 7
                                    AND day = 28
                                    AND duration < 60
                                    AND ppl.license_plate IN (SELECT p.license_plate
                                                                FROM bank_accounts AS ba
                                                                JOIN atm_transactions AS atm
                                                                ON atm.account_number = ba.account_number
                                                                JOIN people as p
                                                                ON p.id = ba.person_id
                                                                WHERE transaction_type = 'withdraw'
                                                                AND atm.account_number IN (SELECT account_number
                                                                                            FROM atm_transactions
                                                                                            WHERE year = 2021
                                                                                                AND month = 7
                                                                                                AND day = 28
                                                                                                AND transaction_type = 'withdraw'
                                                                                                AND atm_location =  'Leggett Street')
                                                                AND year = 2021
                                                                AND month = 7
                                                                AND day = 28
                                                                AND p.license_plate IN (SELECT license_plate
                                                                                        FROM bakery_security_logs
                                                                                        WHERE hour = 10
                                                                                            AND minute BETWEEN 15 AND 25
                                                                                            AND year = 2021
                                                                                            AND month = 7
                                                                                            AND day = 28)));

-- +-------+----------------+-----------------+---------------+-------------------+------------------------+
-- | name  |  phone_number  | passport_number | license_plate | origin_airport_id | destination_airport_id |
-- +-------+----------------+-----------------+---------------+-------------------+------------------------+
-- | Bruce | (367) 555-5533 | 5773159633      | 94KL13X       | 8                 | 4                      |
-- +-------+----------------+-----------------+---------------+-------------------+------------------------+

-- Where was bruce going to?
SELECT a.abbreviation, a.full_name, a.city
FROM flights AS f
JOIN airports AS a
ON a.id = f.destination_airport_id
WHERE destination_airport_id = (SELECT f.destination_airport_id
                                    FROM passengers AS p
                                    JOIN people AS ppl
                                    ON ppl.passport_number = p.passport_number
                                    JOIN flights AS f
                                    ON f.id = p.flight_id
                                    WHERE f.id = (SELECT id
                                                    FROM flights
                                                    WHERE year = 2021
                                                        AND month = 7
                                                        AND day = 29
                                                        ORDER BY hour
                                                        LIMIT 1)
                                    AND ppl.passport_number IN (SELECT ppl.passport_number
                                                                    FROM phone_calls AS pc
                                                                    JOIN people AS ppl
                                                                    ON ppl.phone_number = pc.caller
                                                                    WHERE year = 2021
                                                                        AND month = 7
                                                                        AND day = 28
                                                                        AND duration < 60
                                                                        AND ppl.license_plate IN (SELECT p.license_plate
                                                                                                    FROM bank_accounts AS ba
                                                                                                    JOIN atm_transactions AS atm
                                                                                                    ON atm.account_number = ba.account_number
                                                                                                    JOIN people as p
                                                                                                    ON p.id = ba.person_id
                                                                                                    WHERE transaction_type = 'withdraw'
                                                                                                    AND atm.account_number IN (SELECT account_number
                                                                                                                                FROM atm_transactions
                                                                                                                                WHERE year = 2021
                                                                                                                                    AND month = 7
                                                                                                                                    AND day = 28
                                                                                                                                    AND transaction_type = 'withdraw'
                                                                                                                                    AND atm_location =  'Leggett Street')
                                                                                                    AND year = 2021
                                                                                                    AND month = 7
                                                                                                    AND day = 28
                                                                                                    AND p.license_plate IN (SELECT license_plate
                                                                                                                            FROM bakery_security_logs
                                                                                                                            WHERE hour = 10
                                                                                                                                AND minute BETWEEN 15 AND 25
                                                                                                                                AND year = 2021
                                                                                                                                AND month = 7
                                                                                                                                AND day = 28))));
