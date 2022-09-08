# Github Repos Search Engine

## It is a small and humble app for search public repos in github.

#

### Here I am providing 4 points to make it easier for the reviewer.
  - The stack I am using.
  - The solution appraoch.
  - Some notes about testing.
  - How to run the application.
  - Pending stuff, which I couldn't acheive due to lack of time.But I planning to complete.

  #
  1. Stack
      * I am using ruby and ruby on rails to build the app.
      * I am using Ruby version 3.1.2
      * I using rails version 7.0.3 and ruby version
      * I am using postgresql database
      * I am using RSpec as a testing framework

  2. Solution approach

      * To deal with githubapi, I had two approches:

          *  To use Octokit github Api wrapper.
          *  To talk directly to the github api and fetch required resourcses using one of the HTTP client service including Faraday

              * For me, I found it more convenient and more flexible to talk directly to the github api instead of calling an api wrapper that calls the api itself.So, I decided to fetch resources from the github search endpoint using Faraday HTTP client.And by the way, Octokit is built using Faraday.

              * I created a class (PORO) called GithubApi as a service object which has only the responsibilty for talking to the github api.So, I am not calling the api directly, I am using like a gateway or a proxy for that.

              * I created a tableless class (ReposSearch) or model to validate the search form and in case it is valid, the search param is sent to the repos controller index action.Of course, it is one term and can be validated on the fly.But I prefered to provide an extensible solution to be used in a resilient way in the future.

              * ReposController/index calls the GithubApi class with the given search term and it handles the request and get back the response.

              * I am using Kaminari gem for paginating the response.

              * The search result always return 1000 results as a maximum including the pagination.So, I am displaying 100 pages as a maximum with 10 results per page.

  3. Testing notes:
          
        * I find that it is a very bad approach for not to mocking and stubbing or stubbing the HTTP requests sent to the githup api using libraries like WebMock for example.
        Just in order to avoid api rate limit issues.
        But I did not have time to integrate that in my specs.

        * While testing the GithubApi class, I am testing against the actual response from the github api itself,
        which is bad as I mentioned above.

        * In the ReposSearch table less class, I am testing against if the term is valid and consequently the ReposSearch instance is valid too or not.

        * I decided to simulate the user experince of when searching in github.Especially when providing bad search terms.

        * While testing the repos index spec, the response is always HTML and so I was testing against html unique response for each request.I find that bad, but I did not have enough time to find smarter solution.I always use rails as an api only for the backend and in case I am building the frontend I use react.It is so good to make request specs using rspec and test the frontend using a nice tool like Jest for example.

  4. How to run the app:
      * open your bash profile in case of mac or bashrc file in case of linux and try to configure those env variables for the postgresql username and password and socket or you can do that from the terminal directly:

      
        ```
       
        export PGU='your db user name'
        export PG_PASS='your db password'
        ```
      
      * Open database.yml and set the database credentials.

      * Set your ruby version by editing the .ruby_version file.



      *  ```
          cd /your/directory
         ```
      * 
        ```
        bundle install
        ```
      *  
         ```
         rails db:create
         rails db:migrate
         rails s
         ```

      * For testing, in the same directory, run

         ```
         rspec
         ```
         OR

         ```
         bundle exec rspec
         ```
  4. Pendin tasks
      * Rescuing or protecting against the github service crash.
      * Building a modular and abstract mechanism for handling different error types.
      * Better and nicer UI with good styling.
      * There is only one request spec, which I did not have time to complete. The repos_searches_spec post request

  Thanks
     

