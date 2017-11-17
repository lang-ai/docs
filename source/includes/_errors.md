# Errors

If the request succeeded, the response status will be 200 OK. Otherwise the response status will be 4xx or 5xx as described in the following table:

Error Code | Meaning
---------- | -------
400 | Bad request / Missing fields
401 | Unauthorized
404 | Project not found
429 | Too many requests / Rate limited
500 | Internal server error
