# video_compression
Video compression implementation project

## Introduction

Video compression is a process that aims to reduce the size of a video file while retaining as much of the quality of the original video as possible. There are several ways to do this, including reducing the resolution, frame rate and bit rate of the video.

A common video compression technique is to eliminate redundancy by taking advantage of similarities between images. This can be done using techniques such as motion compensation, which predicts the movement of objects in a frame and uses this information to create a prediction of the next frame.

Another technique is transform coding, which involves changing the way video data is represented to make it more efficient for compression. This transformation can be a spatial transformation, such as the discrete cosine transform (DCT), or a temporal transformation, such as the discrete wavelet transform (DWT).

Video compression algorithms can also use other techniques, such as quantization, entropy coding and data partitioning, to further reduce the size of the video file. The goal is to find the right balance between video quality and file size, and different techniques can be used depending on the specific needs of the video and the desired trade-off between quality and size.

## Characteristics of the video files

Video compression is a process that reduces the size of a video file while minimizing the impact on video quality. It does this by analyzing each frame of the video individually and identifying opportunities to reduce the amount of data needed to represent the image.

One technique used in video compression is to transform the colors of the image from the RGB color space to the YUV color space. The YUV color space separates luminance (brightness) information from chrominance (color) information, which can make data compression more efficient. Several YUV encoding schemes can be used, such as 4:2:2 and 4:2:0, which offer different tradeoffs between video quality and size.

In addition to these techniques, there are also standard formats for digital images, such as CIF (Common Intermediate Format) and QCIF (Quarter Common Intermediate Format), which specify the image resolution in pixels. These formats are used to determine the appropriate compression techniques for video based on the resolution of the image. For example, a CIF image has a resolution of 352x288 pixels, while a QCIF image has a resolution of 179x144 pixels.

## Encoding

Video compression is a process that aims to reduce the amount of data to be transmitted while maintaining as much of the quality of the video as possible. One way to do this is to use **motion estimation and compensation** to create vectors that represent motion in the video.

**Motion estimation** is a technique that analyzes the movements of different objects in a video sequence. It does this by dividing the frames into blocks and comparing the blocks between the different frames. From this, it is possible to deduce the motion vectors of the different objects.

**Motion compensation** is a technique that uses the motion vectors obtained from motion estimation to predict what the next frame of the video will look like. It works by dividing the frames into blocks and comparing them in a similar way to motion estimation.

To simplify the video data, we will use both spatial simplification (dividing the image into blocks) and temporal simplification (predicting the next frame in the sequence). After obtaining the necessary matrices through these techniques, we will apply a discrete cosine transform (DCT) to the data.

The DCT is a mathematical operation that transforms pixels and colors into frequencies and amplitudes. This means that each block in the image can be described using amplitudes and frequencies. Since low frequencies often correspond to movements in the video, we are only interested in low frequencies. To focus on the low frequencies, we will use a technique called quantization, which rounds the floating point numbers of the high frequencies into integers. Although some information may be lost in this step, the changes are generally not noticeable to the human eye.

## Transmission of the binary code to the decoder

The objective of quantizing DCT coefficients is to transmit them to the decoder in the most efficient way possible. One way to do this is to use binary representation, which allows data compression by grouping redundancies into quantized DCT coefficients.

The Huffman coding method can be used to transform the quantized DCT coefficients into binary code. To do this, the occurrences of each coefficient are grouped together and a tree is used to assign a corresponding binary code to each coefficient. When constructing the tree, the value with the higher occurrence is assigned a binary value of 0, or if both values have the same occurrence, the higher value in the tree is assigned a binary value of 0. The goal is to create small blocks of two values so that the tree does not become too deep, and so that we do not end up with more bits to code than we initially had.

The Huffman coding and the tree are then passed to the decoder, which can use them to convert the binary values back into integer values.

### Simplified explanation of the process of using Huffman coding to compress and transmit quantized DCT coefficients

Imagine that you have a bunch of different colored balls and you want to send them to your friend. You could just put all the balls in a box and send them to your friend, but that could take a long time because there are so many balls. So you decide to use a special method to send the balls to your friend faster.

To do this, you start by grouping all the balls by color. Then you count how many balls there are of each color and write down those numbers. For example, you might have 3 red balls, 4 blue balls and 5 green balls.

Then you use what is called a tree to assign each ball color a special code of 0's and 1's. You start by assigning the code "0" to the ball color that has the most balls. Then you assign the code "1" to the ball color that has the second most balls. You continue in this way until you have a special code for each ball color.

For example, if you have 3 red balls, 4 blue balls, and 5 green balls, you can code the green balls "0" (since they have the most), the blue balls "10" (since they have the second most), and the red balls "11" (since they have the least).

Now, instead of sending all the balls to your friend, you can send the special codes for each ball color. Your friend will be able to use the tree you sent to turn the codes into balls of the original color. This way, you can send the balls to your friend much faster than if you had sent all the balls in a box.

## Decoding

First, the decoder receives the binary code that represents the compressed video file. This binary code was created by the encoder by transforming the quantized DCT coefficients of the video into a series of 0s and 1s using Huffman coding. In order to recover the original quantized DCT coefficients of the video, the decoder uses the structure of the compression algorithm, which includes the tree structure that was transmitted along with the binary code.

Once the decoder has recovered the quantized DCT coefficients of the video, the next step is to perform inverse quantization. This involves multiplying each coefficient by a factor that was determined during the compression process in order to restore the values of the coefficients to their original, non-quantized form.

Finally, the inverse DCT is applied to the non-quantized coefficients in order to reconstruct the original video frame. This involves performing the inverse of the DCT transformation that was applied during the compression process. Once the inverse DCT has been applied, the original video frame has been fully recovered and can be displayed to the user.