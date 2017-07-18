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
* The service is hosted under api.lang.ai.

# Authentication

```http
POST /v1/analyze HTTP/1.1
User-Agent: MyClient/1.0.0
Host: api.lang.ai
Content-Type: application/json
Authentication: Bearer my-api-token

```

Authenticate your account when using the API by including your secret API token in every request. You can manage your API tokens in your [Console](http://console.lang.ai). Do not share your secret API tokens in publicly accessible areas such GitHub, client-side code, and so forth.

Authentication to the API is performed via bearer auth tokens which can be retrieved from the Console. We will never ask you to send any password while using the API.

Every request must be authenticated with the your API token.


# Rate Limit
To avoid abuse and ensure that the system remains online for every user, every API request will need to provide valid credentials and the requests can be rate limited if they exceed the limitations.


# Analyze

Analyzes a given text for any of you available classifiers. You can create and edit your classifiers from your [Console](http://console.lang.ai)

### HTTP Request

`POST http://api.lang.ai/v1/analyze`

### Request Body

```json
{
 "text": "The text to be analyzed",
 "classifier_id": "Your classifier id"
}
```

Parameter | Required | Default | Type | Description
--------- | -------  | ------- | ---- | -----------
text      | true     | -       | string | The text to be analyzed.
classifier_id | true | -       | string | The id for the classifier to be used.

### Response

```json
{
  "result": {
    "paterns": ["pattern1", "pattern2"]
  }
}
```
