help:                              # this command
	# [generating help from tasks header]
	@egrep '^[A-Za-z0-9_-]+:' Makefile

osx-build: # Create the executable for OSX
	@GOOS=darwin GOARCH=amd64 go build -o builds/comics-downloader-osx ./cmd/app/

windows-build: # Create the executable for WINDOWS
	@GOOS=windows GOARCH=amd64 go build -o builds/comics-downloader.exe ./cmd/app/

linux-build: # Create the executable for LINUX
	@GOOS=linux GOARCH=amd64 go build -o builds/comics-downloader ./cmd/app/

osx-gui-build: # Create the executable for OSX with GUI
	@CGO_ENABLED=1 GOOS=darwin GOARCH=amd64 go build -o builds/gui-comics-downloader-osx ./cmd/gui/

windows-gui-build: # Create the executable for WINDOWS with GUI
	@CGO_ENABLED=1 GOOS=windows GOARCH=amd64 go build -o builds/gui-comics-downloader.exe ./cmd/gui/

linux-gui-build: # Create the executable for LINUX with GUI
	@CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o builds/gui-comics-downloader ./cmd/gui/


builds: # Create the executables for OSX/Windows/Linux
	@make osx-build
	@make windows-build
	@make linux-build
	@make osx-gui-build
	@make windows-gui-build
	@make linux-gui-build

remove-builds: # Remove executables
	@rm -rf builds/
