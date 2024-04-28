import ballerina/http;
import ballerina/io;
// import ballerina/log;
// import ballerina/time;

configurable string chatApiUrl = ?;

type Ping record {
    string msg;
};

public function main() returns error? {

    json payload = { };
    io:println("chat URL: " + chatApiUrl);

    http:Client clientEp = check new (chatApiUrl);
    Ping ping = check clientEp->/ping;
    io:println("Ping: " + ping.msg);

    // if (jsonResponse is http:Response) {
    //     var result = jsonResponse.getJsonPayload();
    //     if (result is json) {
    //         // value = value + result.toJsonString();
    //         io:println("Ping: " + result.toJsonString());
    //     } else {
    //         // value = value + result.message();
    //         io:println("Ping: " + result.message());
    //     }
    // } else {
    //     io:println("Ping: not http response");

    // }
    
    // Define the request
    http:Request request = new;
    request.method = http:POST;
    request.setPayload(payload);

    // Send the request
    http:Response|error jsonResponse2 = clientEp->post("/messages/addmsg", {"to": "134", "from": "35", "messages": "Time to start using Rob chat"});
     if (jsonResponse2 is http:Response) {
        var result2 = jsonResponse2.getJsonPayload();
        if (result2 is json) {
            // value = value + result.toJsonString();
            io:println("Add msg: " + result2.toJsonString());
        } else {
            // value = value + result.message();
            io:println("Add msg: " + result2.message());
        }
    } else {
        io:println("Add msg: not http response");
    }

    // http:Response|error jsonResponse = clientEp->post("/messages/addmsg/", {from: "134", to: "134",  messsgae: "Time to start using Rob chat"});
}


// public function main() returns error? {
//     io:println("chat URL: " + chatApiUrl);
//     http:Client chatApiEndpoint = check new (chatApiUrl);

//    check  chatApiEndpoint->/messages/sendMsg({"from": "1", "to": "2", "message": "Time to start using Rob chat"});
// }