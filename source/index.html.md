---
title: API Reference

toc_footers:
  - <a href='https://lang.ai/developers'>Request an API Invite</a>

includes:
  - errors

search: true
---

# Overview

Lang.ai is a platform to enable the next generation of NLP products and applications while using unsupervised AI. It analyzes any type of text and extracts intents without any manual training or intent-definition. This allows companies and individuals to get insights from any unstructured text to improve and automate multiple business processes. To learn more about use cases or our proprietary technology, please visit [lang.ai](https://lang.ai).

# Workflow

Lang.ai algorithm adapts to any language, industry or business case given the adequate training data. The typical workflow for using lang.ai API is the following:

* In order to build a custom classifier model, user has to provide a dataset. This can be any collection of customer interactions or any other type of text.
* The algorithm will automatically extract intents and features that the user can edit to further customize to her needs. This process is done in the [Console](https://console.lang.ai).
* Once the classifier model is validated, the lang.ai API can be used in real time to analyze intents in new texts.

# The API

The API is organized around REST. It has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. JSON is returned by all API responses, including errors, although the API libraries convert responses to appropriate language-specific objects.

All requests must be encrypted with HTTPS.

The service is hosted under api.lang.ai.

For more information about our API libraries and use cases, check our [Developers site](https://lang.ai/developers).

# Authentication

```shell
curl https://api.lang.ai/v1/analyze \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -X POST -d '{"text": "The Text", "projectId": "YOUR_PROJECT_ID"}'
```

Authenticate your account when using the API by including your secret API token in every request. You can manage your API tokens in your [Console](https://console.lang.ai). Do not share your secret API tokens in publicly accessible areas such GitHub, client-side code, and so forth.

Authorization to the API is performed via bearer auth tokens which can be retrieved from the Console. We will never ask you to send any password while using the API.

Every request must be authenticated with the your API token.

# Rate Limit
To avoid abuse and ensure that the system remains online for every user, every API request will need to provide valid credentials and the requests can be rate limited if they exceed the limitations. The maximum rate limit is **1000** requests per minute per public IP.

You can request a limit increase by asking your account manager. The process could take some time to review, process, approve, and deploy.

# Analyze

Analyzes a given text using the classifier specified.
You can handle your available classifiers in your [Console](https://console.lang.ai).

### HTTP Request

`POST https://api.lang.ai/v1/analyze`

### Request Body

```json
{
  "text": "The text to be analyzed",
  "projectId": "Your project id"
}
```

Parameter | Required | Default | Type | Description
--------- | -------  | ------- | ---- | -----------
text      | true     | -       | string | The text to be analyzed.
projectId | true     | -       | string | The project to be used to analyze the text.

### Response Body

The response returns a list of zero, one or more intents. Each intent contain the following fields:

Field | Type | Description
--------- | -------  | ------- | ---- | -----------
name      | string | The name of the intent.
features | string[] | The list of features. The sign ">" indicates a second-level feature.
score | number | A value between 0 and 1 that indicates proximity to a given intent.

```json
{
  "intents": [
  	{
  		"name": "intent",
  		"features": ["feature", "feature>feature"],
 		"score": 0.8
  	}
  ]
}
```
