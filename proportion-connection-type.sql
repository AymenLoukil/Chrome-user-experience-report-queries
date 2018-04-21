#standardSQL
SELECT
  form_factor.name AS device,
  ROUND(SUM(fcp.density), 4) AS density
FROM
  `chrome-ux-report.country_fr.*`,
  UNNEST(first_contentful_paint.histogram.bin) AS fcp
WHERE
  origin = 'https://www.amazon.fr'
GROUP BY device
ORDER BY device
