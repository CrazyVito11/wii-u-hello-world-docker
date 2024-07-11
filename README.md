# Wii U Hello World Docker
A simple Hello World application for the Wii U, build with DevKitPro's WUT via Docker.


## Why?
While setting up DevKitPro / WUT manually isn't that difficult, doing it via Docker should lower the barrier to entry even further.

This repository contains the Hello World example from WUT as a proof of concept.


## Setup
To get started with this example, simply follow these steps.

### Copy the example `.env` file
We first want to create the environment file that we will then use inside the container.

An `.env.example` file has been provided, so you only have to make a copy of it and fill it in.

Store the environment file as `.env`, this way it should be picked up by our container later on.

### Fill in the `.env` file
Now that you have an environment file, we can enter our Wii U console's IP address so we can transfer it later on.

> [!TIP]
> It's recommended that you assign a static IP address to your Wii U console.

### Install the WiiLoad plugin
To use the `build-and-test-app.sh` script, your Wii U also needs to have the [WiiLoad plugin](https://github.com/wiiu-env/wiiload_plugin) installed.

Simply follow the steps on their GitHub page.

### Start the container
We should now be ready to start the container!

You can start it using `docker compose up -d`, it should automatically build the image if it's the first time.

> [!TIP]
> If you need to rebuild the image, you can add `--build` at the end of the command.

### Create `Intellisense-src` directory (Recommended)
While this step is optional, it is highly recommended to make the development experience a lot easier.

> [!NOTE]
> In this example we will be using VS Code, but this likely will also work for other IDE's.

First, install the "C/C++" extension from Microsoft.
This can be installed by pressing CTRL + P, and then running `ext install ms-vscode.cpptools`.

> [!TIP]
> If you can't find the extension, you might be running an unofficial build of VS Code that doesn't have Microsoft extensions.
>
> You can install the extension manually by downloading the [.vsix file straight from Microsoft's website](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools).

Once you have the extension installed, simply run `./configure-intellisense.sh` in a terminal on your host to copy the relevant files to your host machine.

Your editor should now be able to find the sources and provide you with proper Intellisense.

## Building + Testing
First, enter the Bash shell of the contain with `docker compose exec builder bash`.

You should now be inside the `/src` directory, in which is the source code of our application and 2 scripts.

If you only want to compile the application, simply run `./build-app.sh` to receive the application in rpx form, which you can then copy onto the SD card.

If you also want to transfer it to your Wii U console over the network with WiiLoad, run `./build-and-test-app.sh` instead.
This should automatically open the application on your Wii U.
