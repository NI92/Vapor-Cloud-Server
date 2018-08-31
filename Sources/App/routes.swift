import Vapor

/** Register your application's routes & services here. */
public func routes(_ router: Router) throws {
    /** Will return contained text IF 'hello' is inputted into url. Example: http://localhost:8080/hello */
    router.get("hello") { (request) in
        return "This is a hello world example!"
    }
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    router.patch("todos", use: todoController.greet)
    
    // TEST
    let timeController = TimeController()
    router.get("currentDate", use: timeController.currentDate)
    router.get("currentTime", use: timeController.currentTime)
    router.get("get", "path", "something", use: todoController.test)
    
    // Encode
    router.post("login") { req -> Future<HTTPStatus> in
        return try req.content.decode(LoginRequest.self).map(to: HTTPStatus.self) { loginRequest in
            print(loginRequest.email)       // user@vapor.codes
            print(loginRequest.password)    // don't look!
            return .ok
        }
    }
    
    // Decode
    router.get("user") { req -> User in
        return User(
            name: "Vapor User",
            email: "user@vapor.codes"
        )
    }
    
    // *NOTE:
    // Async overview: https://docs.vapor.codes/3.0/async/overview/
    // Blocking BUT only on the background thread!
    router.post("transform") { (req) -> Future<String> in
        // Create a new void promise
        let promise = req.eventLoop.newPromise(Void.self)
        
        // Dispatch some work to happen on a background thread
        DispatchQueue.global().async {
            // Puts the background thread to sleep. This will not affect any of the event loops
            sleep(5)
            // When the "blocking work" has completed, complete the promise and its associated future.
            promise.succeed()
        }
        
        // Wait for the future to be completed, then transform the result to a simple String
        return promise.futureResult.transform(to: "Transformation happened within the server!")
    }
}
