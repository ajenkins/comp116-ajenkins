#Snapchat Exploit Code
##Created by AJ Jenkins
##On 12/12/13

###Using the script
To use the script, run:
    ruby decrypt_snap.rb input_file output_file.jpg

If you just want to try the script without getting your own image from Snapchat,
you can use the file "example" as your input. The MD5 checksum of the output
should be: 0bfccdfc493e70cdb35b483bca504bdd

###Getting the encrypted image from Snapchat
I used mitmproxy to get the images from Snapchat, but there are other ways to do
it. For a walkthrough on using mitmproxy to get a Snapchat image from an iPhone,
see the associated paper in the Action Item section.

###Special Thanks
The script I wrote is heavily based on ruby code written by Amelia Cuss, from
her blog post "Snapchat: not for state secrets". You can read it
[here](https://kivikakk.ee/2013/05/10/snapchat.html).
