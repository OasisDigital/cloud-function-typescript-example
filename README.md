# Class List Data Cloud Function Processor

Kyle Cordes - http://kylecordes.com/

Oasis Digital - https://oasisdigital.com/

March 2017

## Why?

At Oasis Digital, we do nearly all of our Node work using TypeScript. We have
found the TypeScript, and type systems in general, are very amenable to rapid
and scalable application development.

## Build, test, run, deploy

I mostly use Yarn because it is faster; it usually does not matter that GCF uses
NPM to install runtime dependencies.

Install dependencies (locally):

```
yarn
```

Compile the TypeScript and run tests:

```
yarn test
```

Run the function, locally:

```
yarn run local
```

Deploy to Google cloud functions:

```
yarn run deploy
```

(However, take a look at the file `gcf.sh`, it is currently hardcoded to deploy
this to my example GCF project. You'll need to adjust this to your own project.)

To try it out on the web:

https://us-central1-cloud-function-ts-example.cloudfunctions.net/hello

(Is up and running as I published, but it might get deleted or changed over
time. The purpose of this repo is to show how the TypeScript process can be
wired together, not to actually publish a hello world forever.)

## Technology stack

* TypeScript -> ES2015
* Node 6.9 can run the ES2015, no need to compile to ES5.
* Google Cloud Functions
* Mocha+Chai

## Other tools to consider

If you don't have a high quality TypeScript IDE yet, consider Visual Studio
Code.

The above `yarn run local` is great for a quick test, but if you need to
emulator locally more of the Google cloud environment, there is an emulator
available:

https://github.com/GoogleCloudPlatform/cloud-functions-emulator

## TODO

In this simple example, the development `package.json` is copied and included
unchanged as the production `package.json`. In our commercial work, we typically
have a more elaborate process to ship a simplified package file that doesn't
contain any remains of the development machinery. The idea is to ship the least
possible complexity to the deployment environment. For example, the simplified
package file would completely omit devDepenencies - although the production
mechanism should never install those, if they are emitted from the file then
even a bug could never accidentally care about them.

The testing files are currently mixed in with the source code and shipped as
part of the function. This is unnecessary, and of the files grew to be more
numerous in a real project would use a slightly more complex configuration to
keep them segregated.

If I recall right, the source of map files will not actually be used when an
error occurs. Additional machinery is required to wire that up, and is
worthwhile.

This example does not show calling any Google Cloud services from inside the
Cloud Function; most real Cloud Functions call such services. To get started on
that, add dependencies on additional packages as described:

https://www.npmjs.com/package/google-cloud

Is better to not depend on the legacy wrapper "google-cloud" package, but
rather on the newer, smaller scoped packages (for example,
'@google-cloud/storage').

## GCloud Settings

The commandline tool stores state in ~/.config/, you can either perform various
configuration commands like those below, although in this project I have used
commandline flags to reduce the need for that.

Please study the GCF documentation.

DON't run these commands, they are here as a reference.

```
gcloud config configurations create my-function-whatever
gcloud config configurations activate my-function-whatever
gcloud config set core/account my.name@my.email.com
gcloud config set core/project my-function-whatever-data-7732
```
