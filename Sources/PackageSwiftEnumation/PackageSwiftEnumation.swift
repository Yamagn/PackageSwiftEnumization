import ArgumentParser
import Foundation

@main
struct PackageSwiftEnumation: ParsableCommand {
    @Argument(help: "Absolute Path of the directory containing Package.swift")
    var rootPath: String

    func run() throws {
        var manifestPath = rootPath
        var sourcesPath = rootPath
        if manifestPath.last == "/" {
            manifestPath += "Package.swift"
            sourcesPath += "Sources"
        } else {
            manifestPath += "/Package.swift"
            sourcesPath += "/Sources"
        }
        let file = URL(fileURLWithPath: manifestPath)
        let modules = try FileManager.default.contentsOfDirectory(atPath: sourcesPath)
        /*
        sourceryコマンドの実行
        input: Inputs/Modules
        output: manifestPath
        args: modules(enumVarがKey, StringがValue)
        */
        let args = modules.map { module in
            // keyの方のmoduleは変数名として正しくフォーマットする
            "\(module)=\(module)"
        }.joined(separator: ",")
        print("sourcery --sources \(manifestPath) --output \(manifestPath) --templates Sources/PackageSwiftEnumation/Templates/sample.stencil --args \(args)")
    }

    // @discardableResult
    // private func shell(_ args: String...) -> Int32 {
    //     let task = Process()
    //     task.launchPath = "/usr/bin/env"
    //     task.arguments = args
    //     task.launch()
    //     task.waitUntilExit()
    //     return task.terminationStatus
    // }
}
