WITH xta AS 
(
    SELECT 
        content_id,
        content_text AS original_text,
        STRING_AGG(
            -- Convert the first letter to uppercase and the rest to lowercase for each word
            UPPER(SUBSTRING(value, 1, 1)) + LOWER(SUBSTRING(value, 2, LEN(value))),
            ' '
        ) AS ct
    FROM 
        user_content
    CROSS APPLY 
        STRING_SPLIT(content_text, ' ') AS split_values
    GROUP BY 
        content_id, content_text
),
yta AS (
    SELECT 
        content_id, 
        original_text,
        STRING_AGG(
            CASE 
                -- If word contains hyphen, capitalize both parts (handling hyphen correctly)
                WHEN PATINDEX('%-%', value) != 0 THEN 
                    -- Split the word into two parts around the hyphen and capitalize both parts
                    UPPER(SUBSTRING(value, 1, 1)) + LOWER(SUBSTRING(value, 2, CHARINDEX('-', value)-1)) + UPPER(SUBSTRING(value, CHARINDEX('-', value)+1, 1)) +
                    LOWER(SUBSTRING(value, CHARINDEX('-', value)+2, LEN(value)))
                ELSE 
                    -- Regular word formatting (first letter uppercase, rest lowercase)
                    UPPER(SUBSTRING(value, 1, 1)) + LOWER(SUBSTRING(value, 2, LEN(value)))
            END,
            ' '
        ) AS converted_text
    FROM 
        xta
    CROSS APPLY 
        STRING_SPLIT(ct, ' ') AS split_values
    GROUP BY 
        content_id, original_text
)
SELECT 
    content_id, 
    original_text, 
    converted_text
FROM yta
ORDER BY content_id;
