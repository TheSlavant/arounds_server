import Vapor

extension Droplet {
    func setupRoutes() throws {
        
        post("user") { req in
            let userController = UserController()
            return userController.create(req)
        }
        
        put("user") { req in
            let userController = UserController()
            return userController.update(req)
        }
        
        put("user/location") { req in
            let userController = UserController()
            return userController.update(req)
        }

    }
}
