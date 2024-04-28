import ballerina/http;
import ballerina/io;
import ballerina/log;
import ballerina/time;

configurable string chatApiUrl = ?;

public function main() returns error? {
    io:println("chat URL: " + chatApiUrl);
    http:Client chatApiEndpoint = check new (chatApiUrl);

    // Sending messages asynchronously using a select clause
    select {
        // First message
        http:Response resp1 = chatApiEndpoint->/messages/sendMsg({"from": "1", "to": "1", "message": "Time to start using Rob chat"});
        // Handling response
        case resp1 is http:Response => {
            log:printInfo("Response for Message 1: ", resp1.getTextPayload());
        }
        // Error handling
        case error err1 => {
            log:printError("Error sending Message 1: ", err1);
        }
    }
    
    // Second message
    select {
        // Second message
        http:Response resp2 = chatApiEndpoint->/messages/sendMsg({"from": "1", "to": "2", "message": "Time to start using Rob chat"});
        // Handling response
        case resp2 is http:Response => {
            log:printInfo("Response for Message 2: ", resp2.getTextPayload());
        }
        // Error handling
        case error err2 => {
            log:printError("Error sending Message 2: ", err2);
        }
    }
}
