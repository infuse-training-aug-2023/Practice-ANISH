
# Docker Commands Used



## Env
Used to Define Env variables

```bash
  ENV "VARIABLE_NAME"="VALUE_TO_BE_SAVED"
```

## RUN 
Is a build command step
```bash 
  RUN "command to execute"
```

## CMD 
It is run when docker Container is started
```bash 
  CMD "command to execute"
```

## Expose
Exposes Container Port to Local Machine
```python 
  EXPOSE "PORT_NUMBER"\"PROTOCOL (UDP\TCP)"
```

## WORKDIR
Used to Set Current Working Directory

```bash
WORKDIR "PATH"
```

## COPY

Used to Copy local file to Container's Working Directory
``` bash
COPY "FILES_TO_COPPY_FROM_HOST_COMPUTER" "PATH_TO_PASTE_FILES"
```

