import ballerina/http;
import ballerina/io;
import ballerina/log;
import ballerina/time;

configurable string chatApiUrl = ?;

public function main() returns error? {
    io:println("chat URL: " + chatApiUrl);
    http:Client chatApiEndpoint = check new (chatApiUrl);

    // Fetching the appointments
   check chatApiEndpoint->/messages/sendMsg(from = 1, to = 1, message="Time to start using Rob chat");
   check chatApiEndpoint->/messages/sendMsg(from = 1, to = 2, message="Time to start using Rob chat");
    // // Send messages
    // check sendChatMessage(chatApiEndpoint, 1, 1, "Time to start using");
    // check sendChatMessage(chatApiEndpoint, 1, 2, "Time to start using");
}