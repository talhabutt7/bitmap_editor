# Bitmap Editor

This program simulates a basic editor of bitmap images using capital letters to represent pixels.

Pixel co-ordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250.

Bitmaps starts at coordinates 1,1.

Colours are specified by capital letters.

# How to Run

To run the main program:
```
$ cd /path/to/bitmap_editor
$ ruby main.rb
```

To run the specification tests using RSpec:
```
$ cd /path/to/bitmap_editor
$ rspec spec/*
```


# Commands

There are 8 supported commands:

* I M N - Create a new M x N image with all pixels coloured white (O).
* C - Clears the table, setting all pixels to white (O).
* L X Y C - Colours the pixel (X,Y) with colour C.
* V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
* H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
* S - Show the contents of the current image
* ? - Displays help text
* X - Terminate the session

# Example

In the example below, > represents input

```
> I 5 6
> L 2 3 A
> S
OOOOO
OOOOO
OAOOO
OOOOO
OOOOO
OOOOO
> V 2 3 6 W
> H 3 5 2 Z
> S
OOOOO
OOZZZ
OWOOO
OWOOO
OWOOO
OWOOO
```
