help:                              # this command
	# [generating help from tasks header]
	@egrep '^[A-Za-z0-9_-]+:' Makefile

osx-build: # Create the executable for OSX
	@GOOS=darwin GOARCH=amd64 go build -o build/comics-downloader-osx ./cmd/app/

windows-build: # Create the executable for WINDOWS
	@GOOS=windows GOARCH=amd64 go build -o build/comics-downloader.exe ./cmd/app/

linux-build: # Create the executable for LINUX
	@GOOS=linux GOARCH=amd64 go build -o build/comics-downloader ./cmd/app/

gui-builds:
	fyne-cross --output comics-downloader-gui --targets=linux/amd64,windows/amd64,darwin/amd64 ./cmd/gui

builds: # Create the executables for OSX/Windows/Linux
	@make osx-build
	@make windows-build
	@make linux-build
	@make gui-builds

remove-builds: # Remove executables
	@rm -rf build/
