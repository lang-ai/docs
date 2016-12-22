# Errors

If the request succeeded, the response status will be 200 OK. Otherwise the response status will be 4xx or 5xx as described in the following table:

Error Code | Meaning
---------- | -------
400 | Bad Request / Missing Fields
401 | Unauthorized
404 | Not Found
429 | Too Many Requests / Rate Limited
500 | Internal Server Error
