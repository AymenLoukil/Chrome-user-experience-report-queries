#standardSQL
SELECT
  _TABLE_SUFFIX AS date,
  origin,
  ROUND(SUM(fcp.density), 4) AS density
FROM
  `chrome-ux-report.country_fr.*`, UNNEST(first_contentful_paint.histogram.bin) AS fcp
WHERE
  origin IN ('https://www.amazon.fr', 'https://fr.aliexpress.fr') AND
  fcp.start < 1000
GROUP BY date,origin
ORDER BY date,origin
