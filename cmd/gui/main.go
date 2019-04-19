package main

import (
	"fyne.io/fyne/app"
	"fyne.io/fyne/widget"

	downloader "github.com/Girbons/comics-downloader/cmd/app"
)

type Downloader struct {
	URL     *widget.Entry
	Country *widget.Entry
	Format  *widget.Radio
}

func (d *Downloader) Submit() {
	downloader.Run(d.URL.Text, d.Country.Text, d.Format.Selected)
}

func (d *Downloader) ClearURLField() {
	d.URL.SetText("")
}

func main() {
	options := []string{"pdf", "epub", "cbr", "cbz"}

	app := app.New()
	w := app.NewWindow("Comics Downloader")

	urlEntry := widget.NewEntry()
	urlEntry.SetPlaceHolder("Comic URL or URLs separated by a comma")

	countryEntry := widget.NewEntry()
	countryEntry.SetPlaceHolder("Country param used by mangarock")

	choices := widget.NewRadio(options, nil)
	choices.SetSelected("pdf")

	d := &Downloader{
		URL:     urlEntry,
		Country: countryEntry,
		Format:  choices,
	}

	form := widget.NewForm()

	form.Append("URL", d.URL)
	form.Append("Country", d.Country)
	form.Append("Output", d.Format)

	clearURLField := widget.NewButton("Clear URL", func() {
		d.ClearURLField()
	})

	submit := widget.NewButton("Download", func() {
		d.Submit()
	})

	form.Append("", submit)
	form.Append("", clearURLField)

	w.SetContent(form)
	w.ShowAndRun()
}
