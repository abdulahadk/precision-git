# Precision 100 Migration Framework
Data migration execution and governance framework

## Usage
Clone the repository and run the following. If environement is properly setup you should see two records in the output table.

```
git clone https://github.com/ennovatenow/precision-git.git
migration.sh cif_migration mock001
```

This assumes that there is an Oracle schema with the name `precision100` with the password `Welcome123` with an Oracle SID of `mig` and all the [prerequisites](https://github.com/ennovatenow/precision-git#prerequisites) components are all properly installed.

### A longer example
If you have an Oracle instance, you can customize the schema and passwords. Customize the following script to your needs.

```
CREATE USER precision100 IDENTIFIED BY "Welcome123"; 
GRANT CONNECT TO precision100;
GRANT CONNECT, RESOURCE, DBA TO precision100;
GRANT CREATE SESSION TO precision100;
GRANT ALL PRIVILEGE TO precision100;
GRANT UNLIMITED TABLESPACE TO precision100;
```

Once the schema and passwords are created, change .env.sh to reflect the customized attributes

```
export USERNAME=precision100
export PASSWORD=Welcome123
export SID=mig
```

Now run the following, you should be able to see 2 records in the output table.

`migration.sh cif_migration mock001`


## Prerequisites
The framework requires the following components to work

1) Oracle database
2) SQL Plus
3) SQL Loader
4) git client
5) git repository
6) bash shell

## Setup
Thank you very much for considering to contribute!

## Contributing
Thank you very much for considering to contribute!

Please make sure you follow our [Code Of Conduct](CODE_OF_CONDUCT.md) and we also strongly recommend reading our [Contributing Guide](CONTRIBUTING.md).

