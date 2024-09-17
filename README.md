 # TEST Jesus Chapi

The following project shows movies from [TMDB](https://awesomeopensource.com/project/elangosundar/awesome-README-templates), which are displayed according to the following description:

- **Popular:** The scroll must be horizontal, it is not necessary to handle pagination

Below 3 categories should be shown:
- **Now Playing** 
- **Upcoming** 
- **Top Rated** 

These categories should be displayed in grid form, limiting to only 6 movies
## Features
For this project we used:
- LazyHStack and LazyVGrid: Views are created only when they are about to appear on the screen, which optimizes memory usage and performance.
    ![Image](https://i.ibb.co/Xb0vJxn/Captura-de-pantalla-2024-09-14-a-la-s-6-05-27-p-m.png)

    ![Image](https://i.ibb.co/mS2jN0x/Captura-de-pantalla-2024-09-14-a-la-s-6-06-03-p-m.png)
- URLSession: Allows us to perform network data transfer tasks, such as downloading data from and uploading data to endpoints indicated by URLs.
    ![URLSESSION](https://i.ibb.co/DGkTwp5/Captura-de-pantalla-2024-09-14-a-la-s-6-13-01-p-m.png)
- Use of Singleton: We created a class "MovieStore" with private initializer and only one public constant, to let us use this single instance.
    ![SINGLETON](https://i.ibb.co/6WRTDm7/Captura-de-pantalla-2024-09-14-a-la-s-6-18-44-p-m.png)
- Use of DispatchQueue .background to perform background task and  DispatchQueue.main.async to update UI. I use [weak self] to prevent ARC.
    ![threads](http://imgfz.com/i/2CLnEHM.png)
- Own tab bar component for grid section
    ![tabar](https://i.ibb.co/KwBJ8Rm/Captura-de-pantalla-2024-09-14-a-la-s-6-28-58-p-m.png)
- Unit Test: I tested some features
    ![unitTest](http://imgfz.com/i/Am4DlYg.png)
    ![sericio](http://imgfz.com/i/OcnXI0Q.png)
- Unit test: Also test screen navigation, usig XCUIApplication to acces screens on or device or emulator
   (![image](https://github.com/user-attachments/assets/663bad82-bc61-4df1-94c2-c4b616fc5c4f)

)

### Answer and write 

- What does the single responsibility principle consist of? What's its purpose?

    Is one of the five SOLID principles, it states that a class or module should have only one reason to change, meaning it should have only one job or responsibility.

    The main purposes are:

    - Enhance Cohesion: By ensuring that a class or module has a single responsibility, it becomes more cohesive. 

    - Improve Maintainability: When a class has only one reason to change.

    - Facilitate Reusability: Classes with a single responsibility are more likely to be reusable in different contexts because they are not tightly coupled with other functionalities.

    - Simplify Testing: A class with a single responsibility is easier to test because it has a well-defined behavior and fewer dependencies. 

- What characteristics does, in your opinion, a “good” code or clean code have?

    In my opinion it has to be readable, easy to catch it, also have a good documentation to understand the overall structure and purpose of the code, don't leave code commented if it is no longer necessary, follow the SOLID principles and take into account the design patterns.

- Detail how you would do everything that you have not completed.

    For the Watchlist part I had planned to use CodeData to store the movies that are chosen as desired to watch, an attribute "watchlist: Bool" would have to be added to the "Movie" structure that would manage the "watchlist" status. When entering the interface where the desired movies are displayed, only those that have this active status would be shown.

    
## Access Token fom TMDB 

You need to get the tmdb token to be able to use the services

`Authorization: Beaer "Token"`




#### Project structure

![URL SESSION](https://subir-imagen.com/images/2024/09/14/Captura-de-pantalla-2024-09-14-a-las-1.24.49p.m..png)

![Image](https://subir-imagen.com/images/2024/09/14/2bf85107-4463-47f1-99a6-2fedc094075f.jpeg)

![Image](https://subir-imagen.com/images/2024/09/14/9a283d1e-238e-4937-bff0-94e019b24133.jpeg)
![Image](https://subir-imagen.com/images/2024/09/14/28a8cfb4-25b8-49af-af1a-3dea17623e5e.jpeg)
![Image](https://subir-imagen.com/images/2024/09/14/39fbb536-83ec-4ca9-aab6-3aea733cfc4d.jpeg)
![Image](https://subir-imagen.com/images/2024/09/14/58e95d12-1625-4b7d-8537-8dad08ccceda.jpeg)
![Image](https://dl.imgdrop.io/file/aed8b140-8472-4813-922b-7ce35ef93c9e/2024/09/14/a798241f-9f32-4b8a-809b-e2c784fdcd294e95d114d15e9b2b.jpeg)
![Image](https://dl.imgdrop.io/file/aed8b140-8472-4813-922b-7ce35ef93c9e/2024/09/14/d1f33f87-1e75-4439-851b-f91ffb9cf4908f01792619023a7b.jpeg)
