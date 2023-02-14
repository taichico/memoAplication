struct SampleItem {
    let title: String

    static func createItems() -> [SampleItem] {
        let items = [
            SampleItem(title: "Apple"),
            SampleItem(title: "Banana"),
            SampleItem(title: "Orange"),
            SampleItem(title: "Grape"),
            SampleItem(title: "Strawberry")
        ]
        return items
    }
}
