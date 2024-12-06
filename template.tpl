___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Permate Conversion Tag",
  "categories": ["AFFILIATE_MARKETING", "ADVERTISING", "ATTRIBUTION"],
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Add script to page",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "params",
    "displayName": "Input params",
    "simpleValueType": true,
    "valueHint": "offer_id\u003d1234\u0026external_conversion_id\u003d{external_conversion_id}"
  },
  {
    "type": "TEXT",
    "name": "tracking_domain",
    "simpleValueType": true,
    "defaultValue": "https://qa.pmdevtk.com",
    "displayName": "Tracking Domain"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Nhập mã mẫu của bạn tại đây.
const log = require('logToConsole');
const getCookieValues = require('getCookieValues');
const getUrl = require('getUrl');
const callInWindow = require('callInWindow');
const copyFromWindow = require('copyFromWindow');
const encodeUriComponent = require('encodeUriComponent');
const sendPixel = require('sendPixel');
const getType = require('getType');
const Object = require('Object');
const JSON = require('JSON');

const TRACKING_DOMAIN = data.tracking_domain;

function processData() {
  let params = data.params;
  if (!TRACKING_DOMAIN) {
    log('TRACKING_DOMAIN is undefined');
    return;
  }
  if (!params) {
    log('params is undefined');
    return;
  }
  let pbUrl = TRACKING_DOMAIN + '/postback/browser?' + params;
  let pmClick = getCookieValues('pm_click')[0];
  if (!pmClick) {
    log('pm_click is undefined');
    return;
  }
  let jsonPMClick = JSON.parse(pmClick);
  pbUrl += '&origin=' + encodeUriComponent(getUrl('origin')) + '&click_uuid=' + jsonPMClick.click;
  callInWindow('pmCallbackUrl');
  let pmVariable = copyFromWindow('pmVariable');
  if (pmVariable && getType(pmVariable) == 'object') {
    Object.keys(pmVariable).forEach(key => {
      pbUrl += '&' + key + '=' + encodeUriComponent(pmVariable[key]);
    });
  }
  sendPixel(pbUrl);
}

processData();

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "pmCallbackUrl"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "pmVariable"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_pixel",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []
setup: ''


___NOTES___

Created on 11/26/2024, 3:00:35 PM


