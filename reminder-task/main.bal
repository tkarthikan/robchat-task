import ballerina/http;
import ballerina/io;
// import ballerina/log;
// import ballerina/time;

configurable string chatApiUrl = ?;


public function main() returns error? {

    json payload = { };
    io:println("chat URL: " + chatApiUrl);

    http:Client clientEp = check new (chatApiUrl);

    // Define the request
    http:Request request = new;
    request.method = http:POST;
    request.setPayload(payload);

    // Send the request
    http:Response|error jsonResponse = clientEp->post("/messages/addmsg", {"to": "134", "from": "35", "messages": "Time to start using Rob chat"});

    // http:Response|error jsonResponse = clientEp->post("/messages/addmsg/", {from: "134", to: "134",  messsgae: "Time to start using Rob chat"});
}


// public function main() returns error? {
//     io:println("chat URL: " + chatApiUrl);
//     http:Client chatApiEndpoint = check new (chatApiUrl);

//    check  chatApiEndpoint->/messages/sendMsg({"from": "1", "to": "2", "message": "Time to start using Rob chat"});
// }