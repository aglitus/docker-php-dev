<h3>  This is a Docker environment for PHP development!</h3>
<h5>Including PHP 8 with Apache, MySQL 8.0 and PhpMyAdmin. It also includes the necessaries extensions for PDO connections, ODBC Drivers (necessary for MSSQL connections), XDebug and more!</h5>
<h3>Simply put your PHP applications inside the "www" folder to start working with them!</h3>
<h2><b>How to setup XDebug in Visual Studio Code and Docker?</b></h2>

<p>First, you'll need to download the PHP Debug extension.</p>

![extension](https://user-images.githubusercontent.com/85963939/215350609-8631262b-30f7-4082-9fe4-ab16f02a70e7.png)

<p>Next, go to "Run and debug" (the icon with a play button and a bug), then click the area where it says "create a launch.json file." </p>

![debug](https://user-images.githubusercontent.com/85963939/215350692-59b9d12b-1f3d-40da-bb19-9f108d0aa96c.png)

<p>Then, select the workspace you'll want to work it (in this case, docker-php-dev). After that, select "Docker: debug in container." </p>

![docker](https://user-images.githubusercontent.com/85963939/215350950-559f4f4a-38d5-4e8d-9b54-06446db1d1e3.png)

This will create a new folder in the workspace called ".vscode" with a new JSON file, "launch.json" in it. Here's how it will look like first: 

![config](https://user-images.githubusercontent.com/85963939/215351135-1e44a83c-ace4-45d5-8989-e088f9bb9553.png)

We need to put some new things inside "configurations", so we can map the files inside the container with our files opened in Visual Studio Code.

![path](https://user-images.githubusercontent.com/85963939/215351335-c7773ec7-ce9b-4728-903a-c6bf2669defc.png)

<ul>
  <li><b>"name:" </b>The name it will show when you execute the debug, you can change it to anything you'd like.</li>
  <li><b>"type:" </b>Indicates the debugging language.</li>
  <li><b>"request:" </b>Indicates if the configuration is suppose to launch or attach.</li>
  <li><b>"port:" </b>The port that XDebug is listening. 9003 is the default.</li>
  <li><b>"pathMappings:" </b>Here, you'll map the files from the Docker image to your local files. You can put ${workspaceFolder} inside it, since VSCode understands locally the project files are under the current opened directory. But if doesn't work, you can put the directory the project is, for example "/User/Documents/Projects/docker-php-dev".
</ul>
 
<h4><b>All done! Everything is set up to start your debugging. To start it, go back to "Run and debug" and execute it. </b></h4>
  
![debugdone](https://user-images.githubusercontent.com/85963939/215352200-71703601-8fde-4a97-8b0c-f03dd9076c39.png)


