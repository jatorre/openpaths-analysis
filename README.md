Open Paths Analysis repository
==================

This is a cookbook repository of recipes for analyzing Open Paths location data. Mainly SQL but anything else is welcomed.

[Open Paths](https://openpaths.cc/) is a project that allows you to collect information about where you have been on your mobile phone. 
It does not have to use your GPS and therefore it does not ruin your battery, so therefore you can silently collect
continuosly your location data. The project allows you to download the data as CSV.

The goal of this project is to come up with a set of reciepes that can be useful when anlyzing this data. Like for example:
How do I find the flights done in this time period, or Which area normally you go out on weekends? Where do you live?
Where do you work? All these questions can be answered with a bit of analysis.

For the time being these are just a collection of SQL reciepes based on a table structure as follows:

 * openpaths: This the raw data from openpaths. It basically is a collection of location traces, lat/lon and timestamp.
 * openpaths_segments: If you connect every point with the follwing one you create a table of "lines" or "segments"
and for each segment you can determine the speed and the distance which can be very useful for lot of analysis.

Tools being used:
==================

Right now we are only using [CartoDB](http://www.cartodb.com) as a way to analyze the data. CartoDB is an Open Source tool based on PostgreSQL
and PostGIS.