---
title: API Reference

toc_footers:
  - <a href='http://lang.ai'>Sign Up for a Developer Key</a>

includes:
  - errors

search: true
---

# Overview

* This document describes the API for lang.ai.
* All requests must be encrypted with https.
* Except POST /login, every request must be authenticated with the user's token.
* The service will be hosted under api.lang.ai.

# Authentication

```http
POST /v1/login HTTP/1.1
User-Agent: MyClient/1.0.0
Accept: application/vnd.lang-ai.2+json
Host: api.lang.ai
Content-Type: application/json

{
  "email":"your@email.com",
  "pass": "yourpassword"
}
```

> The above command returns your authentication token:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{"token":"YOUR LANG.AI TOKEN"}
```

Except POST /login, every request must be authenticated with the user's token.

# Rate Limit
To avoid abuse and ensure that the system remains online for every user, API requests will need to use a token and the requests can be rate limited if they exceed the limitations.

TBD: Rate limit proposal 60 calls per minute.

# Categories

Retrieves a list of available categories with its description.

### HTTP Request

`GET http://api.lang.ai/v1/categories`

### Query Parameters

```
{
 "data": [
  {
   "name": "Category Name",
   "description": "brief description of what this category means"
  },
  {
   "name": "Category Name",
   "description": "brief description of what this category means"
  },
 ]
}
```

Parameter | Required | Default | Description
--------- | -------  | ------- | -----------
token     | true     | -       |   The user token.
lang      | false    | en      | Valid params: "es" or "en".
domain    | false    | -    | A valid domain name. Categories list will include only categories that belong to this domain.
pattern    | false    | -   | A valid pattern name. Categories list will include only categories that belong to this pattern.

# Patterns

Retrieves a list of available patterns with its description.

### HTTP Request

`GET http://api.lang.ai/v1/patterns`

### Query Parameters

```
{
 "data": [
  {
   "name": "Pattern Name",
   "description": "brief description of what this pattern means"
  },
  {
   "name": "Pattern Name",
   "description": "brief description of what this pattern means"
  },
 ]
}
```

Parameter | Required | Default | Description
--------- | -------  | ------- | -----------
token     | true     | -       | The user token.
lang      | false    | en      | Valid params: "es" or "en".
domain    | false    | -       | A valid domain name. Patterns list will include only patterns that belong to this domain.

# Domains

Retrieves a list of available domains with its description.

### HTTP Request

`GET http://api.lang.ai/v1/domains`

### Query Parameters

```
{
 "data": [
  {
   "name": "Domain Name",
   "description": "brief description of what this domain means"
  },
  {
   "name": "Domain Name",
   "description": "brief description of what this domain means"
  },
 ]
}
```

Parameter | Required | Default | Description
--------- | -------  | ------- | -----------
token     | true     | -       | The user token.
lang      | false    | en      | Valid params: "es" or "en".

# Analyze

Analyzes a given text for an specific domain.

### HTTP Request

`POST http://api.lang.ai/v1/analyze`

### Query Parameters

```
{
 "sentiment": "POSITIVE|NEGATIVE|OBJECTIVE",
 "patterns": ["pattern1", "pattern2"],
 "categories": ["category1", "category2"]
}
```

Parameter | Required | Default | Type | Description
--------- | -------  | ------- | ---- | -----------
token     | true     | -       | string | The user token.
lang      | false    | en      | string | Valid params: "es" or "en".
domains   | false    | -       | string | Valid domain name.
targets   | false    | -       | array | Entities to be analyzed.
private   | false    | false   | boolean | If this field is included and is set to true, Lang.ai wont store any information or logs about that message.

### About the target field in the analyze request

This field is optional but, if it is available, this field is used for the entity that should receive the analysis/sentiment of the message. This field usually helps to avoid false positives increasing the accuracy.
