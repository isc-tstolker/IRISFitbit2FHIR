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
      "name": "Authorization",
      "description": "OAuth2 Authorization"
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
    "/oauth2-redirect.html": {
      "get": {
        "tags": [ 
          "Authorization"
        ],
        "x-ISC_CORS": true,
        "summary": "Handle OAuth2 flow",
        "operationId": "OAuth2Redirect",
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
    }
  },
  "definitions": {
  }
}
}

}
