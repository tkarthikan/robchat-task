import ballerina/http;
import ballerina/io;
import ballerina/log;
import ballerina/time;

configurable string chatApiUrl = ?;


public function main() returns error? {
    // Define the request payload
    json payload = { "from": 35, "to": 134, "messsgae": "Time to start using Rob chat"};
    io:println("chat URL: " + chatApiUrl);
    // http:Client client = check new (chatApiUrl);
    http:Client clientEp = check new (chatApiUrl);

    // Define the request
    http:Request request = new;
    request.method = http:POST;
    request.setPayload(payload);

    // Send the request
    http:Response response = check clientEp->post("/messages/addmsg/", request);

    // Print the response
    io:println("Response: ", response);
}


// public function main() returns error? {
//     io:println("chat URL: " + chatApiUrl);
//     http:Client chatApiEndpoint = check new (chatApiUrl);

//    check  chatApiEndpoint->/messages/sendMsg({"from": "1", "to": "2", "message": "Time to start using Rob chat"});
// }