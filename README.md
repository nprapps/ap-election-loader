# AP ELECTION LOADER
Relies on [the NYT/NPR AP election loader]() to get results from the AP API. Demonstrates a method putting those results into a PostgreSQL database using the COPY method and the loader's CSV output.

## Getting started

### Install the software
```
git clone https://github.com/nprapps/ap-election-loader && cd ap-election-loader
mkvirtualenv ap-election-loader
pip install -r requirements.txt
```

### Export environment variables
```
export AP_API_KEY=<your API key>
```

### Bootstrap the database

This will create all tables and load initial data:

```
./bootstrap.sh
```

### Update results

```
./update.sh
```
