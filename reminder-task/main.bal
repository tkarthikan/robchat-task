import ballerina/http;
import ballerina/io;
import ballerina/log;
import ballerina/time;

configurable string chatApiUrl = ?;

public function main() returns error? {
    io:println("chat URL: " + chatApiUrl);
    http:Client chatApiEndpoint = check new (chatApiUrl);

    // Fetching the appointments
   check chatApiEndpoint->/sendMsg(from = 1, to = 1, message="Time to start using Rob chat");
   check chatApiEndpoint->/sendMsg(from = 1, to = 2, message="Time to start using Rob chat");
    // // Send messages
    // check sendChatMessage(chatApiEndpoint, 1, 1, "Time to start using");
    // check sendChatMessage(chatApiEndpoint, 1, 2, "Time to start using");

    return ();
}

function sendChatMessage(http:Client client, int from, int to, string message) returns error? {
    // Send message using HTTP POST request
    http:Response response = check client->post("/sendMsg", message, {
        "from": from,
        "to": to
    });

    if (response.statusCode == 200) {
        io:println("Message sent successfully");
        return ();
    } else {
        log:printError("Failed to send message. Status code: " + response.statusCode);
        return error "Failed to send message";
    }
}