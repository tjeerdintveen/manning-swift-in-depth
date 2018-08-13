//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Passing protocols with associated types

import Foundation
import UIKit

protocol Worker {
    associatedtype Input
    associatedtype Output
    
    @discardableResult
    func start(input: Input) -> Output
}

class MailJob: Worker {
    typealias Input = String
    typealias Output = Bool
    
    func start(input: String) -> Bool {
        // Send mail to emailaddress (input can represent an email address)
        // On finished, set output
        return true
    }
}

class FileRemover: Worker {
//    typealias Input = URL
//    typealias Output = [String]
    
    func start(input: URL) -> [String] {
        do {
            var results = [String]()
            let fileManager = FileManager.default
            let fileURLs = try fileManager.contentsOfDirectory(at: input, includingPropertiesForKeys: nil)
            
            for fileURL in fileURLs {
                try fileManager.removeItem(at: fileURL)
                results.append(fileURL.absoluteString)
            }
            
            return results
        } catch {
            print("Clearing directory failed.")
            return []
        }
    }
}


//: ## Passing Workers around

func runWorker<W: Worker>(worker: W, input: [W.Input]) {
    input.forEach { (value: W.Input) in
        worker.start(input: value)
    }
}

final class User {
    let firstName: String
    let lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

let mailJob = MailJob()
runWorker(worker: mailJob, input: ["grover@@sesamestreetcom", "bigbird@sesamestreet.com"])

let fileRemover = FileRemover()
runWorker(worker: fileRemover, input: [
    URL(fileURLWithPath: "./cache", isDirectory: true),
    URL(fileURLWithPath: "./tmp", isDirectory: true),
    ])

func runWorker<W>(worker: W, input: [W.Input])
    where W: Worker, W.Input == User {
        input.forEach { (user: W.Input) in
            worker.start(input: user)
            print("Finished processing user \(user.firstName) \(user.lastName)")
        }
}

//: ## Passing a PAT to a type

final class ImageCropper: Worker {
    
    let size: CGSize
    init(size: CGSize) {
        self.size = size
    }
    
    func start(input: UIImage) -> Bool {
        // process image to self.size
        // return bool to indicate that the process succeeded
        return true
    }
}


final class ImageProcessor<W: Worker>
where W.Input == UIImage, W.Output == Bool {
    
    let worker: W
    
    init(worker: W) {
        self.worker = worker
    }
    
    private func process() {
        // start batches
        var results = [Bool]()
        
        let amount = 50
        var offset = 0
        var images = fetchImages(amount: amount, offset: offset)
        var failedCount = 0
        while !images.isEmpty {
            
            for image in images {
                if !worker.start(input: image) {
                    failedCount += 1
                }
            }
            
            offset += amount
            images = fetchImages(amount: amount, offset: offset)
        }
        
        print("\(failedCount) images failed")
    }
    
    private func fetchImages(amount: Int, offset: Int) -> [UIImage] {
        // Not displayed: Return images from database or harddisk
        return [UIImage(), UIImage()]
    }
}

let cropper = ImageCropper(size: CGSize(width: 200, height: 200))
let imageProcessor: ImageProcessor<ImageCropper> = ImageProcessor(worker: cropper)

//: ## Protocol Inheritance

protocol ImageWorker: Worker where Input == UIImage, Output == Bool {
    // extra methods can go here if you want
}

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
