# file_env
Utility function for exporting ```VARIABLE_FILE``` variables as ```VARIABLE``` with values set to the content of the file.

Pushed to separate repository for easier re-use.

# Usage

```
env_file VARIABLE [default value]
```

# Examples
Take a file ```/path/to/file``` with the following contents:
```
example
```

and the following variable definition:
```bash
EXAMPLE_FILE=/path/to/file
file_env EXAMPLE
echo $EXAMPLE
```
will yield the following result
```
example
```

### With default value
```bash
file_env EXAMPLE2
echo $EXAMPLE2 "fallback"
```
will yield the following result
```
fallback
```

# Credit
Code borrowed from https://github.com/invoiceninja/dockerfiles/blob/master/entrypoint.sh