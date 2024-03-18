/// Fitbit API Endpoint for Notifications
Class Fitbit.Api.v1.spec Extends %REST.Spec [ ProcedureBlock ]
{

Parameter UseSession = 0;

/// If Strict=0 (false), then only the swagger properties which are needed for code generation are checked during compile.
/// If Strict=1 (true), then all swagger properties are checked during compile.
Parameter Strict = 1;

Projection Fixer As Fitbit.Api.Fixer;

/// Projection to fix generated classes
/// For support of CORS
Parameter HandleCorsRequest = 1;

XData OpenAPI [ MimeType = application/json ]
{
{
  "swagger": "2.0",
  "info": {
    "title": "Fitbit Notification API",
    "version": "1.0"
  },
  "host": "iris.dev.iscdev.nl",
  "basePath": "/fitbit",
  "tags": [
    {
      "name": "Notifications",
      "description": "Notifications sent by Fitbit"
    }
  ],
  "paths": {
    "/swagger": {
      "get": {
        "tags": [ 
        ],
        "x-ISC_CORS": true,
        "summary": "Get Swagger spec of this API",
        "operationId": "OpenAPI",
        "produces": [
          "application/json"
        ],
        "security": [
          {
            "basicAuth": []
          }
        ],
        "parameters": [],
        "responses": {
          "200": {
            "description": "Succes"
          },
          "404": {
            "description": "Not Found"
          },
          "500": {
            "description": "Internal Server Error"
          }
        }
      }
    },
    "/notify": {
      "get": {
        "tags": [ 
          "Notifications"
        ],
        "x-ISC_CORS": true,
        "summary": "Verify Notification Endpoint",
        "operationId": "VerifyCode",
        "security": [
        ],
        "parameters": [
          {
            "name": "verify",
            "required": false,
            "in": "query",
            "type": "string"
          }
        ],
        "responses": {
          "204": {
            "description": "Correct verification Code"
          },
          "404": {
            "description": "Incorrect verification Code"
          },
          "500": {
            "description": "Internal Server Error"
          }
        }
      },
      "post": {
        "tags": [ 
          "Notifications"
        ],
        "x-ISC_CORS": true,
        "summary": "Handle Notifications",
        "operationId": "HandleNotifications",
        "consumes": [
          "application/json"
        ],
        "security": [
        ],
        "parameters": [
          {
            "name": "notifications",
            "in": "body",
            "description": "List of Notifications",
            "schema": {
              "$ref": "#/definitions/Notifications"
            },
            "required": true
          }
        ],
        "responses": {
          "204": {
            "description": "Succes"
          },
          "500": {
            "description": "Internal Server Error"
          }
        }
      }
    }
  },
  "definitions": {
    "Notifications": {
      "type": "array",
      "items" : {
        "type": "object",
        "properties": {
          "collectionType": {
            "type": "string",
            "description": "Type of Notification",
            "enum": [
              "activities",
              "body",
              "foods",
              "sleep",
              "userRevokedAccess",
              "deleteUser"
            ]
          },
          "date": {
            "type": "string",
            "format": "date",
            "description": "Date of Notification (YYYY-MM-DD)",
            "example": "2024-03-18"
          },
          "ownerId": {
            "type": "string",
            "description": "Fitbit UserId",
            "example": "4D8CR2"
          },
          "ownerType": {
            "type": "string",
            "description": "ownerType, currently always 'user'",
            "example": "user"
          },
          "subscriptionId": {
            "type": "string",
            "description": "Subscription Id"
          }
        }
      }
    }
  }
}
}

}
