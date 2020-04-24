# PET Vocabulary  List and Pronunciation for MACOS



This is a simple 2020 PET vocabulary list. You can download the list at the website https://www.cambridgeenglish.org/. 

I make some changes so that my kid can listen this list freely.

First, I turn the original PDF type into a txt type which can be easily read by a shell script. The txt file name is    [PET2020.txt](https://github.com/wenjacky/PETVocabulary/blob/master/PET2020.txt)

Then, I write a simple shell script which uses the "say" application included in a MAC OS like laptop. 

You can use this script to read PET vocabulary aloud. You can set some simple parameters, such as the number of repeated readings and the interval between readings. You can also set whether to start reading from the end of the last time, or from the specified word.

Usage：

Place the files in the same directory, and then execute the following command.

`chmod +x reading.sh`

`./reading`

