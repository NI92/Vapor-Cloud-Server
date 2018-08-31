import Vapor

/** Called 'after' the application has booted, but 'before' it has started running! */
public func boot(_ app: Application) throws {
    /*
     * Access to the 'Application' is available here which you can use to create any services you might need.
     */
    
    let timestamp = Date()
    print("Booted at \(timestamp)")
    
    // Shutdown
//    app.eventLoop.shutdownGracefully { (error) in
//        if let err = error {
//            print(err)
//        }
//    }
}
