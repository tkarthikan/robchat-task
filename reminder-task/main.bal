import ballerina/http;
import ballerina/io;
import ballerina/log;
import ballerina/time;

configurable string chatApiUrl = ?;
import ballerina/http;

public function main() returns error? {
    // Define the request payload
    json payload = { "from": 35, "to": 134, "messsgae": "Time to start using Rob chat"};
    io:println("chat URL: " + chatApiUrl);
    // http:Client client = check new (chatApiUrl);
    http:Client client = new;

    // Define the request
    http:Request request = new;
    request.method = http:POST;
    request.setPayload(payload);

    // Send the request
    http:Response response = check client->send(`${chatApiUrl}/messages/sendMsg`, request);

    // Print the response
    io:println("Response: ", response);

    // Close the client
    client.close();

    // Return any error occurred
    return response.statusCode != 200 ? error("Request failed with status code: " + response.statusCode) : ();
}


// public function main() returns error? {
//     io:println("chat URL: " + chatApiUrl);
//     http:Client chatApiEndpoint = check new (chatApiUrl);

//    check  chatApiEndpoint->/messages/sendMsg({"from": "1", "to": "2", "message": "Time to start using Rob chat"});
// }