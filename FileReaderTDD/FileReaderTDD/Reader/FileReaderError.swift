enum FileReaderError: Equatable, Error {
    case missingFile(path: String)
    case missingDocumentsURL
}
