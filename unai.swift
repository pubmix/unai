class DigitalClassroom {
var accessCode: String
var admin: User
var users: [User]
var chatLogs: [String]
var files: [File]


init(accessCode: String, admin: User) {
    self.accessCode = accessCode
    self.admin = admin
    self.users = [admin]
    self.chatLogs = []
    self.files = []
}

func addUser(user: User) {
    self.users.append(user)
}

func removeUser(user: User) {
    if let index = self.users.firstIndex(of: user) {
        self.users.remove(at: index)
    }
}

func addFile(file: File) {
    self.files.append(file)
}

func removeFile(file: File) {
    if let index = self.files.firstIndex(of: file) {
        self.files.remove(at: index)
    }
}

func addChatLog(chatLog: String) {
    self.chatLogs.append(chatLog)
}

func removeChatLog(chatLog: String) {
    if let index = self.chatLogs.firstIndex(of: chatLog) {
        self.chatLogs.remove(at: index)
    }
}

func setAdmin(user: User) {
    self.admin = user
}

func terminateClassroom() {
    // code to terminate classroom
}

func getFiles() -> [File] {
    return self.files
}

func getFileByName(name: String) -> File? {
    for file in self.files {
        if file.name == name {
            return file
        }
    }
    return nil
}
}

 var privateChats: [String: [User]] // Dictionary of private chats keyed by a unique ID
    
    init(accessCode: String, admin: User) {
        // ...
        self.privateChats = [:]
    }
    
    func addChatLog(chatLog: String) {
        if chatLog.contains("#study") {
            // Parse the usernames from the chat log using regex
            let regex = try! NSRegularExpression(pattern: "@([a-zA-Z0-9_]+)")
            let matches = regex.matches(in: chatLog, range: NSRange(chatLog.startIndex..., in: chatLog))
            let selectedUsers = matches.map { match in
                String(chatLog[Range(match.range(at: 1), in: chatLog)!])
            }.compactMap { username in
                self.users.first(where: { $0.username == username })
            }
            
            // If there are selected users, create a new private chat
            if !selectedUsers.isEmpty {
                let chatID = UUID().uuidString // Generate a unique ID for the private chat
                self.privateChats[chatID] = selectedUsers
                let privateChatLog = "\(self.admin.username) started a private chat with \(selectedUsers.map({ $0.username }).joined(separator: ", ")):\n"
                self.privateChats[chatID]?.forEach({ user in
                    user.addNotification(notification: privateChatLog)
                })
                self.privateChats[chatID]?.append(self.admin)
                let message = chatLog.replacingOccurrences(of: "#study", "").trimmingCharacters(in: .whitespaces)
                addPrivateChatLog(chatLog: message, chatID: chatID)
                return
            }
        }
        
        // If there are no selected users, add the chat log to the main chat
        self.chatLogs.append(chatLog)
    }
    
    func addPrivateChatLog(chatLog: String, chatID: String) {
        let privateChatLog = "\(self.admin.username): \(chatLog)"
        self.privateChats[chatID]?.forEach({ user in
            user.addNotification(notification: privateChatLog)
        })
    }
    
    // ...
}

class User {
var username: String
var isAdmin: Bool
var notifications: [String]

swift
Copy code
init(username: String, isAdmin: Bool) {
    self.username = username
    self.isAdmin = isAdmin
    self.notifications = []
}

func addNotification(notification: String) {
    self.notifications.append(notification)
}

func clearNotifications() {
    self.notifications = []
}
}

class File {
var name: String
var owner: User
var annotations: [Annotation]

init(name: String, owner: User) {
    self.name = name
    self.owner = owner
    self.annotations = []
}

func addAnnotation(annotation: Annotation) {
    self.annotations.append(annotation)
}
}

enum AnnotationType {
case highlight
case underline
case paraphrase
case comment
case question
case like
case love
}

class Annotation {
var type: AnnotationType
var user: User
var content: String

init(type: AnnotationType, user: User, content: String) {
    self.type = type
    self.user = user
    self.content = content
}
}

let admin = User(username: "admin", isAdmin: true)
let classroom = DigitalClassroom(accessCode: "123456", admin: admin)

// Add users to the classroom
let user1 = User(username: "user1", isAdmin: false)
let user2 = User(username: "user2", isAdmin: false)
classroom.addUser(user: user1)
classroom.addUser(user: user2)

// Remove user from the classroom
classroom.removeUser(user: user2)

// Add file to the classroom
let file1 = File(name: "example.pdf", owner: admin)
classroom.addFile(file: file1)

// Remove file from the classroom
classroom.removeFile(file: file1
                     
    
    func addFile(file: File) {
        if containsSuspiciousContent(content: file.name) {
            self.admin.addNotification(notification: "\(file.owner.username)'s file \(file.name) contains suspicious content.")
        } else {
            self.files.append(file)
        }
    }
    

