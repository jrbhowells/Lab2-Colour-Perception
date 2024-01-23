# Lab 2 - Colour and Perception

This lab session has two parts. In the first part, you will experience various physiological and psychological phenomenons related to your vision, colour perception and how the brain makes up missing visual information.  In the second part, you will explore how colour images are separated into different colour spaces and how these could be used to perform various useful function to enhance what you see.

Before you start this Lab Session, clone this repo to your local machine and do all your work on your local copy.

---
## Part 1 - Seeing Colours and Shapes
---

### Task 1 - Find your blind spot

Play the video [here](http://www.ee.ic.ac.uk/pcheung/teaching/DE4_DVS/assets/blind_spot_test.mp4) and follow its instruction.  Write in your logbook what you learned from this task.

<video src="assets/blind_spot_test.mp4" width="480" height="360" controls></video>

### Task 2 - Ishihara Colour Test

The Ishihara test is a colour vision test deisgned to detect deficiencies in the long and medium cones.  It consists of one set of pictures containing colour dots with a number embedded within.  Your goal is to identify the number you see in each of them.

You can start the test [here](Ishihara_test.md).

### Task 3 - Reverse colour

1. Get hold of a white sheet of paper and hold it up next to your screen.  
2. Now stare at white dot in the centre of the American Flag in funny colours shown below for 10 seconds.  
3. Suddenly switch your gaze to the white sheet of paper.


You should see the American flag in the normal red, white and blue colours.

<p align="center"> <img src="assets/american_flag.jpg" /> </p><BR>

Explain the reason why this happens.

### Task 4 - Troxler's Fading

Here is another example to demonstrate the Opponent Process Theory.  Play the video [here](http://www.ee.ic.ac.uk/pcheung/teaching/DE4_DVS/assets/purple_dots.mp4) and follow the instruction.  

<video src="assets/purple_dots.mp4" width="640" height="320" controls></video>

Write down in your logbook the reason of what you see.  Read the Wikipedia page on Troxler's fading [here](https://en.wikipedia.org/wiki/Troxler%27s_fading), which explains this phenomenon and relates it to the human visual system.

[Here](http://www.ee.ic.ac.uk/pcheung/teaching/DE4_DVS/assets/blue_circle.mp4) is another experiment to test the phenomenon.  Play the video and comment.

<video src="assets/blue_circle.mp4" width="640" height="320" controls></video>

### Task 5 - Brain sees what it expects

Our brain interprets what we see based on our expectation.  Here is an example.  The image below shows two tables with blue and red tops.  Which is the larger table?  Measure this on the screen with a ruler (or just marking on a sheet of paper).  Write in your logbook the reason for this phenomenon.

<p align="center"> <img src="assets/table.jpg" /> </p><BR>

Here is another example, where our brain see what it expects instead of what light reaches the retina.  Which is darker, the square labelled A or B?

<p align="center"> <img src="assets/shadow.jpg" /> </p><BR>

To verify that in fact A and B are exactly the same colour of grey, you may need to capture this image and use an image editing to extract the B square and put it next to A for comparison.

### Task 6 - The Grid Illusion

When you stare at the centre of the grid below, you should see black dots at the intersection appearing and disappearing.  You can read more about it [here](https://en.wikipedia.org/wiki/Grid_illusion).

<p align="center"> <img src="assets/grid.jpg" /> </p><BR>

### Task 7 - Cafe Wall Illusion

Do you see the following brick wall layers are parallel?  Then measure the boundaries of each layer with a ruler.

<p align="center"> <img src="assets/bricks.jpg" /> </p><BR>

This phenomenon is not observed for the following image when the contrast is lower.

<p align="center"> <img src="assets/cbricks.jpg" /> </p><BR>

You can find out more about this [here](https://en.wikipedia.org/wiki/Café_wall_illusion).


### Task 8 - the Silhouette Illusion

[Here](http://www.ee.ic.ac.uk/pcheung/teaching/DE4_DVS/assets/dancer.m4v) is video of a spinning dancer.  Play the video and looking at it for some time, you may find that the dance would suddenly spinning in the opposite direction.  The explanation for this phenomenon can be found [here](https://en.wikipedia.org/wiki/Spinning_dancer).

<video src="assets/dancer.m4v" width="640" height="640" controls></video>


---
## Part 2 - Exploring Colours in Matlab
---

In the second part of Lab 2, you will import from a file a full colour image (called RGB or TrueColour) and map this to various colour spaces.  You will then examine what each of the channels in these colour spaces look like.  

### Task 9 - Convert RGB image to Grayscale

Although full colour images contain much more information than grayscale images, we often find that they contain too much information and require unnecessary calculations. Instead it may be better to turn the colour image into a grayscale image before we perform various processing such as feature extraction.

Open Matlab and navigate the current working folder to the matlab folder of Lab 2.  (You do this via the icon ![Alt text](image.png)).  The photo **peppers.png** is already stored in this folder.  First find out what is contained in this photo file with **imfinfo( )**:
```
imfinfo('peppers.png')
```
Matlab will return some information about this image file such as its size and the format of the image data.

Read the image data into the array RGB and display it:(Remember to add the semicolon at the end of the imread statement to suppress printing of all the image data read.)
```
RGB = imread('peppers.png');  
imshow(RGB)
```
In this task, we will convert the RGB image into a grayscale image. The formula to perform this mapping is:
```
    I = 0.299 * R + 0.587 * G + 0.114 * B 
```

In matrix form, it is:

<p align="center"> <img src="assets/grayscale_eq.jpg" /> </p>

The function **im2gray( )** converts RGB values to grayscale values by forming a weighted sum of the R, G, and B components according to the equation above. 

```
I = rgb2gray(RGB);
figure              % start a new figure window
imshow(I)
```

It would easier for us to compare the two photo if we display them side-by-side. This can be done with:

```
imshowpair(RGB, I, 'montage')
```

### Task 10 - Splitting an RGB image into separate channels

RGB = imread('peppers.png');
imshow(RGB)

Split the image into its component red, green, and blue channels.

[R,G,B] = imsplit(RGB);

Display the three color channels as a montage. Red peppers have a signal predominantly in the red channel. Yellow and green peppers have a signal in both the red and green channels. White objects, such as the garlic in the foreground, have a strong signal in all three channels.

montage({R,G,B},'Size',[1 3])


### Task 11 - Map RGB image to HSV space and into separate channels

Convert the RGB image to the HSV colorspace by using the rgb2hsv function.  Then split it into H, S and V channels.

HSV = rgb2hsv(RGB);
[HSV] = imsplit(HSV);
montage({H,S,V}, 'Size', [1 3]))


### Task 12 - Map RGB image to XYZ space

XYZ = rgb2xyz(RGB);

figure
imshowpair(RGB,XYZ, 'montage');

title('Image in RGB Colour Space (left) and XYZ Colour Space (Right)')

[X,Y,Z] = imsplit(XYZ);
montage({X,Y,Z}, 'Size', [1 3])