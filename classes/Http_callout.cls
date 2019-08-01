public class Http_callout {
    
    public static void api_callout(){
        
        Http http = New Http();
        HttpRequest request = New HttpRequest();
        request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        string body = response.getBody();
        system.debug(body);
        
        
    }

}