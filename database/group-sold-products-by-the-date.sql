SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold, -- Count of distinct products
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product ASC) AS products -- Sorted products
FROM (
    SELECT DISTINCT sell_date, product
    FROM Activities
) AS DistinctProducts
GROUP BY sell_date;
