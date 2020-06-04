---
title: "Massively Scaling Heterogeneous Sensors For IOT Projects On The Cheap"
date: 2020-05-29T12:14:34+06:00
image: "images/blog/bPost3_Img-1.png"
description: ""
author: "Shantanu Patel, FX Engineering"
---

Recently, my team at LG's Future Experiences kicked off a new product that required integrating 100s of sensors. To add to the complexity, there were different types of sensors. Each has its own data type, frequency, and communication protocol. I needed to build a massively scalable sensor fusion platform. My critical goals for the system were: 1) Make a unified way to collect and then process data at the edge. 2) Present a single point to the analytics and business layer of the app. Sometimes in an innovation lab, you have dive into uncharted waters, so off I went.
### Don't Hire A Semi-Truck To Move A Brick
I started by considering the most commonly used and perhaps intuitive solution - HTTP requests. However, I quickly realized that using HTTP to solve this problem is similar to using an 18-wheeler truck to move a single brick.

HTTP requests or web sockets are great but they take a long time. For each HTTP POST, for example, requests can take up to 1/2 second to 1 second per request. Parallel processing can easily solve this problem allowing for real-time data-rates of 10-100Hz. Dispatching 100 processes per second, on the other hand, will quickly cause performance issues on restricted resources on the sensor nodes. HTTP requests to send a couple of bytes of sensor data as a payload is also overkill. This is because HTTP is a plain text protocol with larger headers. HTTP is the 18-wheeler truck moving single brick - a packet of sensor data, which makes no sense. The opportunity cost of the resources, pre-processing, and post-processing is both unnecessary and consumes restricted resources on the edge.

### Finding The Right Tool For The Right Job
During our experiments, we looked into three foundational attributes to design a scalable and robust sensor fusion system:
> * **1. Reliability: Sensors pipeline must be robust while sending data with no-loss at high frequency. Missing a single data point can add gaps in data and cause a delay, as much as twice the sampling frequency.**
> * **2. Lightweight: Battery and computation are major constraints for the IoT microcontrollers and edge-processing units. Any solution needs to utilize minimal resources on the edge even as we scale to hundreds of sensors with low latency. On the server-side, a lightweight solution should enable rapid development and be able to handle streams of data up to 10,000 data points per second.**
> * **3. Modularity: At any point, we need to be able to add new sensors and remove malfunctioning ones of an existing sensor type. These events should be contained, and not require system wide downtime. We also need to be able to test and develop new sensor types. A modular design can also accelerate our ability to add new sensor types.**

### How We Did It
We had 4 sensor types to manage so we knew from prior experience that "Pub-Sub" could be a good starting point for us. Publish-Subscribe (Pub-Sub) type of architecture enables many different sensors to simultaneously send data to many different applications. Another important aspect of pub/sub based communication is that every microcontroller or sensor on the network acts as a modular puzzle piece. In addition, Pub-Sub creates one-to-many and many-to-many communication layers, so this means on the server we can easily add additional features like data-filtering, detection algorithms, and decision-making applications at scale.

<img class="img-fluid w-100" src="/images/blog/bPost3_Img-1.png" alt="h-diagram">

We settled on MQTT implementation of Pub-Sub targeted for Machine to Machine communication.

MQTT has a better Quality-of-Service, response time, and lower packet-size as compared to HTTP or even to some other Pub-Sub Implementations we evaluated. In addition, there are great open-source communities with pointers for low-computation/low-power microcontrollers, which will accelerate our development work.

### And We Got Some Unexpected Perks
One surprising benefit we learned, is that MQTT can enable not just sensor to cloud transmission, but also cloud-to-edge transmission. Debugging a sensor is a difficult process because many times it requires you to re-flash the firmware. Using Pub-Sub you can simply flash one firmware that has a second a "topic" or channel on the sensor and use this to get detailed debugging and testing information without changing or interrupting the data transmission. This allowed rapid iteration without having to create and burn new firmware for each iteration - a process that could take up to ten minutes at a time.

At FX we investigate many different product opportunities with many different technologies. This type of architecture is useful beyond our current investigation. For example, we can use this architecture for multi-sensor projects in robotics, mobility services, remote sensing, computer vision, and host of other applications.

Overall, the one thing I learned from this experience is that sometimes diving deeper and charting out different technologies and tool-sets allows us to build new systems that are even better than what we imagined possible.
