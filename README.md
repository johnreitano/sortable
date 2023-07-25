# README

### Testing via curl

- add delete and show

- PATCH

```
curl -X PATCH http://localhost:3000/customers/1/highlight_types/2 \
     -H 'Content-Type: application/json' \
     -H 'Accept: application/json' \
     -d '{"skip_verify_authenticity_token": true, "highlight_type": { "position": 0 } }'
```

- POST to the top

```
curl -X POST http://localhost:3000/customers/1/highlight_types \
     -H 'Content-Type: application/json' \
     -H 'Accept: application/json' \
     -d '{"skip_verify_authenticity_token": true, "highlight_type": { "name": "Danger", "color": "#red" } }'
```

- POST to arbitrary position

```
curl -X POST http://localhost:3000/customers/1/highlight_types \
     -H 'Content-Type: application/json' \
     -H 'Accept: application/json' \
     -d '{"skip_verify_authenticity_token": true, "highlight_type": { "name": "Unclear", "color": "#red", "position": 2 } }'
```
