import CxxModule


public struct ExportStruct {
    public static func getFromCPP() -> String {
        return getHello().description
    }
}
