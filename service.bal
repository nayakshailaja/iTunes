import ballerina/http;
type iTunesSearchItem record{
 string collectionName;
 string collectionViewUrl;
};
type iTunesSearchResult record {
iTunesSearchItem[] results;
};
service /pickagift on new http:Listener(8080){
    resource function get albums(string artist) returns string|error? {
        http:Client iTunes = check new("https://itunes.apple.com");
        iTunesSearchResult search = check iTunes->get("/search?term=" + artist + "&entity=album&attribute=allArtistTerm");
        return search.results[0].collectionName;
    }
}
