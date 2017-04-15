*What are some common HTTP status codes?*  
**100** = Continue, so far everything is OK  
**103** = Server received the request and is processing  
**200** = Success of either GET, HEAD, POST, TRACE  
**304** = Response has not been modified and client can continue using same cached version of response  
**300** = Multiple possible responses, user must choose one
**301** = Moved permanently, likely new URI would be given in the response  
**400** = Bad request, invalid syntax  
**401** = Unauthorized, needs to authenticate  
**403** = Forbidden, client has no access rights  
**404** = Not found, server cannot find requested resource  
**408** = Request timeout, server shuts down idle connection (servers may skip this status response and just shut down anyway)  
**500** = Internal server error, server doesn't know how to handle request.  
**501** = Method is not implemented and is not supported by the server. GET and HEAD must not return this code  
**503** = Service unavailable, server is under maintenance or getting fixed
**511** = Network authentication required, client must authenticate to gain access

*What is the difference between a GET request and a POST request? When might each be used?*

| GET Requests | POST Requests
|-
|Can be cached |Never cached
|Can be bookmarked |Cannot be bookmarked
|Never be used when dealing with sensitive data |Must be used when dealing with sensitive data
|Parameters remain in the browser history |Parameters are not saved in browser history
|Have data length restriction | No data length restrictions
|Data is visible to everyone | Data is not displayed in the URL
|Harmless when clicking the back button | Data will be re-submitted when back button is clicked

*Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?*  
A cookie is a small piece of data sent from a website and stored on the user's computer by the web browers while the user is browsing. The browser sends them back to the server with every request, introducing states into otherwise stateless HTTP transactions.  Without cookies, each retrieval of a web page or component of a web page would be an isolated event, largely unrelated to all other page views made by the user on the website.
