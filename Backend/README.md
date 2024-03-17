## API Documentation

This document outlines the usage and endpoints of the provided API.

### Base URL
```
https://api.campuscal.tech/
```

### Authentication
No authentication is required for accessing the endpoints.

### Error Handling
Errors are returned as JSON objects with a `result` key indicating "error" and a `type` key specifying the type of error encountered.

---

### Endpoints

#### User Related Operations

##### Create User
- **URL:** `/user/create`
- **Method:** `POST`
- **Request Body:**
  - `user_username` (string): Username of the user.
  - `user_email` (string): Email of the user.
  - `user_pass` (string): Password of the user.
  - `user_name` (string): Name of the user.
- **Response:**
  - `result` (string): Result of the operation.
  - `uuid` (string): UUID of the created user.

##### Set User Preferences
- **URL:** `/user/preferences`
- **Method:** `POST`
- **Request Body:**
  - `user_uuid` (string): UUID of the user.
  - `user_preferences` (object): Preferences of the user.
- **Response:**
  - `result` (string): Result of the operation.

##### Get User Preferences
- **URL:** `/user/preferences`
- **Method:** `GET`
- **Query Parameters:**
  - `user_uuid` (string): UUID of the user.
- **Response:**
  - `result` (string): Result of the operation.
  - `uuid` (string): UUID of the user.
  - `preferences` (string): User preferences.

#### Organization Related Operations

##### Create Organization
- **URL:** `/organization/create`
- **Method:** `POST`
- **Request Body:**
  - `org_owner` (string): UUID of the organization owner.
  - `org_name` (string): Name of the organization.
  - `org_description` (string): Description of the organization.
- **Response:**
  - `result` (string): Result of the operation.
  - `uuid` (string): UUID of the created organization.

##### Get Organization Information
- **URL:** `/organization/info`
- **Method:** `GET`
- **Query Parameters:**
  - `org_uuid` (string): UUID of the organization.
- **Response:**
  - `result` (string): Result of the operation.
  - `uuid` (string): UUID of the organization.
  - `owner` (string): UUID of the organization owner.
  - `name` (string): Name of the organization.
  - `description` (string): Description of the organization.

##### List All Organizations
- **URL:** `/organizations`
- **Method:** `GET`
- **Response:**
  - `result` (string): Result of the operation.
  - `organizations` (array): Array of organization objects.

#### Event Related Operations

##### Create Event
- **URL:** `/event/create`
- **Method:** `POST`
- **Request Body:**
  - `event_name` (string): Name of the event.
  - `event_org` (string): UUID of the organization hosting the event.
  - `event_description` (string): Description of the event.
  - `event_starttime` (string): Start time of the event.
  - `event_endtime` (string): End time of the event.
  - `event_university` (string): University associated with the event.
  - `event_url` (string): URL of the event.
  - `event_type` (string): Type of the event.
- **Response:**
  - `result` (string): Result of the operation.
  - `uuid` (string): UUID of the created event.

##### Get Event Information
- **URL:** `/event/info`
- **Method:** `GET`
- **Query Parameters:**
  - `event_uuid` (string): UUID of the event.
- **Response:**
  - `result` (string): Result of the operation.
  - Event attributes (various): Information about the event.

##### Upvote Event
- **URL:** `/event/upvote`
- **Method:** `GET`
- **Query Parameters:**
  - `event_uuid` (string): UUID of the event.
- **Response:**
  - `result` (string): Result of the operation.
  - `votes` (integer): Updated vote count of the event.

##### Downvote Event
- **URL:** `/event/downvote`
- **Method:** `GET`
- **Query Parameters:**
  - `event_uuid` (string): UUID of the event.
- **Response:**
  - `result` (string): Result of the operation.
  - `votes` (integer): Updated vote count of the event.

##### List Events
- **URL:** `/events`
- **Method:** `GET`
- **Query Parameters:**
  - `user_uuid` (string): UUID of the user.
  - `taylored` (boolean): Whether to get tailored recommendations.
- **Response:**
  - `result` (string): Result of the operation.
  - `events` (array): Array of event objects.

#### Miscellaneous

##### List Universities
- **URL:** `/universities`
- **Method:** `GET`
- **Response:**
  - `result` (string): Result of the operation.
  - `universities` (object): Object containing UUIDs and names of universities.

##### Test Endpoint
- **URL:** `/test`
- **Methods:** `GET`, `POST`
- **Response:**
  - `result` (string): Result of the operation.
  - `uuid` (string): UUID for testing purposes.

---

This documentation provides an overview of the available endpoints, their functionalities, request methods, and expected responses. Please refer to this document for integrating and utilizing the API effectively.