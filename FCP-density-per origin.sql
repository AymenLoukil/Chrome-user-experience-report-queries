#standardSQL
SELECT
  origin,
  ROUND(SUM(fcp.density), 4) AS density
FROM
  `chrome-ux-report.country_fr.201803` , UNNEST(first_contentful_paint.histogram.bin) AS fcp
WHERE
  origin IN ('https://www.amazon.fr', 
             'https://fr.aliexpress.com' ) AND
  fcp.start < 1000
GROUP BY origin
ORDER BY density DESC
