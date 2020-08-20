//
//  Persistence.swift
//  Shared
//
//  Created by Ben Cardy on 19/08/2020.
//

import CoreData


struct ThemeFixture {
    var theme: String
    var setCount: Int
    var subthemeCount: Int
    var yearFrom: Int
    var yearTo: Int
    
    func toTheme(_ context: NSManagedObjectContext?) -> Theme {
        let newItem: Theme
        if let context = context {
            newItem = Theme(context: context)
        } else {
            newItem = Theme()
        }
        newItem.theme = theme
        newItem.setCount = Int32(setCount)
        newItem.subthemeCount = Int32(subthemeCount)
        newItem.yearTo = Int32(yearTo)
        newItem.yearFrom = Int32(yearFrom)
        newItem.favourite = [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false].randomElement()!
        return newItem
    }
    
}


struct BricksetSetFixture {
    
    var setID: Int
    var number: String
    var numberVariant: Int
    var name: String
    var year: Int
    var themeName: String
    var themeGroup: String?
    var subtheme: String?
    var category: String
    var released: Bool
    var pieces: Int?
    var minifigs: Int?
    var bricksetURL: String
    var rating: Double
    var reviewCount: Int
    var packagingType: String
    var availability: String
    var instructionsCount: Int
    var additionalImageCount: Int
    var imageURL: String?
    var thumbnailURL: String?
    
    func toBricksetSet(_ context: NSManagedObjectContext?) -> BricksetSet {
        let set: BricksetSet
        if let context = context {
            set = BricksetSet(context: context)
        } else {
            set = BricksetSet()
        }
        set.setID = Int32(setID)
        set.number = number
        set.numberVariant = Int32(numberVariant)
        set.name = name
        set.year = Int32(year)
        set.themeName = themeName
//        if let themeGroup = themeGroup { set.themeGroup = themeGroup }
//        if let subtheme = subtheme { set.subtheme = subtheme }
        set.themeGroup = themeGroup ?? ""
        set.subtheme = subtheme ?? ""
        set.category = category
        set.isReleased = released
//        if let pieces = pieces { set.pieces = Int32(pieces) }
//        if let minifigs = minifigs { set.minifigs = Int32(minifigs) }
        set.pieces = Int32(pieces ?? -1)
        set.minifigs = Int32(minifigs ?? -1)
        set.bricksetURL = bricksetURL
        set.rating = rating
        set.reviewCount = Int32(reviewCount)
        set.packagingType = packagingType
        set.availability = availability
        set.instructionsCount = Int32(instructionsCount)
        set.additionalImageCount = Int32(additionalImageCount)
//        if let imageURL = imageURL { set.imageURL = imageURL }
//        if let thumbnailURL = thumbnailURL { set.thumbnailURL = thumbnailURL }
        set.imageURL = imageURL ?? ""
        set.thumbnailURL = thumbnailURL ?? ""
        return set
    }
    
}


let previewThemeData = [
    ThemeFixture(theme: "4 Juniors", setCount: 24, subthemeCount: 5, yearFrom: 2003, yearTo: 2004),
    ThemeFixture(theme: "Action Wheelers", setCount: 9, subthemeCount: 0, yearFrom: 2000, yearTo: 2001),
    ThemeFixture(theme: "Adventurers", setCount: 72, subthemeCount: 4, yearFrom: 1998, yearTo: 2003),
    ThemeFixture(theme: "Agents", setCount: 13, subthemeCount: 0, yearFrom: 2008, yearTo: 2009),
    ThemeFixture(theme: "Alpha Team", setCount: 32, subthemeCount: 3, yearFrom: 2001, yearTo: 2005),
    ThemeFixture(theme: "Aqua Raiders", setCount: 7, subthemeCount: 0, yearFrom: 2007, yearTo: 2007),
    ThemeFixture(theme: "Aquazone", setCount: 28, subthemeCount: 6, yearFrom: 1995, yearTo: 1999),
    ThemeFixture(theme: "Architecture", setCount: 54, subthemeCount: 4, yearFrom: 2008, yearTo: 2020),
    ThemeFixture(theme: "Assorted", setCount: 10, subthemeCount: 1, yearFrom: 1989, yearTo: 1999),
    ThemeFixture(theme: "Atlantis", setCount: 24, subthemeCount: 1, yearFrom: 2010, yearTo: 2011),
    ThemeFixture(theme: "Avatar The Last Airbender", setCount: 2, subthemeCount: 0, yearFrom: 2006, yearTo: 2006),
    ThemeFixture(theme: "Baby", setCount: 44, subthemeCount: 1, yearFrom: 2000, yearTo: 2005),
    ThemeFixture(theme: "Basic", setCount: 413, subthemeCount: 5, yearFrom: 1972, yearTo: 2003),
    ThemeFixture(theme: "Batman", setCount: 15, subthemeCount: 0, yearFrom: 2005, yearTo: 2008),
    ThemeFixture(theme: "Belville", setCount: 82, subthemeCount: 3, yearFrom: 1994, yearTo: 2008),
    ThemeFixture(theme: "Ben 10: Alien Force", setCount: 6, subthemeCount: 0, yearFrom: 2010, yearTo: 2010),
    ThemeFixture(theme: "Bionicle", setCount: 389, subthemeCount: 38, yearFrom: 2001, yearTo: 2016),
    ThemeFixture(theme: "Boats", setCount: 12, subthemeCount: 0, yearFrom: 1982, yearTo: 1996),
    ThemeFixture(theme: "Books", setCount: 404, subthemeCount: 38, yearFrom: 1966, yearTo: 2020),
    ThemeFixture(theme: "Boost", setCount: 1, subthemeCount: 0, yearFrom: 2017, yearTo: 2017),
    ThemeFixture(theme: "Brick Sketches", setCount: 4, subthemeCount: 2, yearFrom: 2020, yearTo: 2020),
    ThemeFixture(theme: "BrickHeadz", setCount: 98, subthemeCount: 17, yearFrom: 2016, yearTo: 2020),
    ThemeFixture(theme: "Bricks and More", setCount: 67, subthemeCount: 3, yearFrom: 2006, yearTo: 2014),
    ThemeFixture(theme: "Building Set with People", setCount: 29, subthemeCount: 0, yearFrom: 1974, yearTo: 1978),
    ThemeFixture(theme: "Bulk Bricks", setCount: 141, subthemeCount: 5, yearFrom: 2000, yearTo: 2006),
    ThemeFixture(theme: "Cars", setCount: 28, subthemeCount: 3, yearFrom: 2011, yearTo: 2012),
    ThemeFixture(theme: "Castle", setCount: 281, subthemeCount: 23, yearFrom: 1978, yearTo: 2016),
    ThemeFixture(theme: "City", setCount: 663, subthemeCount: 29, yearFrom: 2005, yearTo: 2020),
    ThemeFixture(theme: "Classic", setCount: 63, subthemeCount: 3, yearFrom: 1998, yearTo: 2020),
    ThemeFixture(theme: "Clikits", setCount: 85, subthemeCount: 2, yearFrom: 2003, yearTo: 2006),
    ThemeFixture(theme: "Collectable Minifigures", setCount: 671, subthemeCount: 35, yearFrom: 2010, yearTo: 2020),
    ThemeFixture(theme: "Creator", setCount: 425, subthemeCount: 7, yearFrom: 1995, yearTo: 2020),
    ThemeFixture(theme: "Creator Expert", setCount: 76, subthemeCount: 11, yearFrom: 2000, yearTo: 2020),
    ThemeFixture(theme: "Dacta", setCount: 167, subthemeCount: 10, yearFrom: 1960, yearTo: 2003),
    ThemeFixture(theme: "DC Comics Super Heroes", setCount: 123, subthemeCount: 14, yearFrom: 2011, yearTo: 2020),
    ThemeFixture(theme: "DC Super Hero Girls", setCount: 12, subthemeCount: 1, yearFrom: 2016, yearTo: 2017),
    ThemeFixture(theme: "Dimensions", setCount: 68, subthemeCount: 6, yearFrom: 2015, yearTo: 2017),
    ThemeFixture(theme: "Dino", setCount: 7, subthemeCount: 0, yearFrom: 2012, yearTo: 2012),
    ThemeFixture(theme: "Dino 2010", setCount: 5, subthemeCount: 0, yearFrom: 2005, yearTo: 2005),
    ThemeFixture(theme: "Dino Attack", setCount: 6, subthemeCount: 0, yearFrom: 2005, yearTo: 2006),
    ThemeFixture(theme: "Dinosaurs", setCount: 12, subthemeCount: 0, yearFrom: 2001, yearTo: 2001),
    ThemeFixture(theme: "Discovery", setCount: 6, subthemeCount: 0, yearFrom: 2003, yearTo: 2003),
    ThemeFixture(theme: "Disney", setCount: 79, subthemeCount: 14, yearFrom: 2014, yearTo: 2020),
    ThemeFixture(theme: "Dots", setCount: 21, subthemeCount: 0, yearFrom: 2020, yearTo: 2020),
    ThemeFixture(theme: "Duplo", setCount: 1227, subthemeCount: 45, yearFrom: 1969, yearTo: 2020),
    ThemeFixture(theme: "Education", setCount: 254, subthemeCount: 14, yearFrom: 1998, yearTo: 2020),
    ThemeFixture(theme: "Elves", setCount: 41, subthemeCount: 1, yearFrom: 2015, yearTo: 2018),
    ThemeFixture(theme: "Exo-Force", setCount: 44, subthemeCount: 4, yearFrom: 2006, yearTo: 2008),
    ThemeFixture(theme: "Explore", setCount: 127, subthemeCount: 8, yearFrom: 2002, yearTo: 2004),
    ThemeFixture(theme: "Fabuland", setCount: 107, subthemeCount: 0, yearFrom: 1979, yearTo: 1989),
    ThemeFixture(theme: "Factory", setCount: 7, subthemeCount: 3, yearFrom: 2005, yearTo: 2008),
    ThemeFixture(theme: "FORMA", setCount: 4, subthemeCount: 0, yearFrom: 2019, yearTo: 2019),
    ThemeFixture(theme: "Freestyle", setCount: 75, subthemeCount: 0, yearFrom: 1995, yearTo: 1999),
    ThemeFixture(theme: "Friends", setCount: 414, subthemeCount: 22, yearFrom: 2012, yearTo: 2020),
    ThemeFixture(theme: "Fusion", setCount: 4, subthemeCount: 0, yearFrom: 2014, yearTo: 2014),
    ThemeFixture(theme: "Galidor", setCount: 20, subthemeCount: 0, yearFrom: 2002, yearTo: 2002),
    ThemeFixture(theme: "Games", setCount: 48, subthemeCount: 2, yearFrom: 2009, yearTo: 2013),
    ThemeFixture(theme: "Gear", setCount: 2319, subthemeCount: 138, yearFrom: 1971, yearTo: 2020),
    ThemeFixture(theme: "Ghostbusters", setCount: 2, subthemeCount: 0, yearFrom: 2016, yearTo: 2016),
    ThemeFixture(theme: "Harry Potter", setCount: 97, subthemeCount: 13, yearFrom: 2001, yearTo: 2020),
    ThemeFixture(theme: "HERO Factory", setCount: 106, subthemeCount: 1, yearFrom: 2010, yearTo: 2014),
    ThemeFixture(theme: "Hidden Side", setCount: 32, subthemeCount: 1, yearFrom: 2019, yearTo: 2020),
    ThemeFixture(theme: "Hobby Set", setCount: 9, subthemeCount: 0, yearFrom: 1975, yearTo: 2003),
    ThemeFixture(theme: "Homemaker", setCount: 32, subthemeCount: 0, yearFrom: 1971, yearTo: 1982),
    ThemeFixture(theme: "Ideas", setCount: 32, subthemeCount: 2, yearFrom: 2010, yearTo: 2020),
    ThemeFixture(theme: "Indiana Jones", setCount: 18, subthemeCount: 4, yearFrom: 2008, yearTo: 2009),
    ThemeFixture(theme: "Island Xtreme Stunts", setCount: 13, subthemeCount: 0, yearFrom: 2002, yearTo: 2003),
    ThemeFixture(theme: "Jack Stone", setCount: 25, subthemeCount: 0, yearFrom: 2001, yearTo: 2002),
    ThemeFixture(theme: "Juniors", setCount: 67, subthemeCount: 13, yearFrom: 2014, yearTo: 2018),
    ThemeFixture(theme: "Jurassic World", setCount: 38, subthemeCount: 5, yearFrom: 2015, yearTo: 2020),
    ThemeFixture(theme: "Legends of Chima", setCount: 142, subthemeCount: 11, yearFrom: 2013, yearTo: 2015),
    ThemeFixture(theme: "LEGO Art", setCount: 4, subthemeCount: 0, yearFrom: 2020, yearTo: 2020),
    ThemeFixture(theme: "LEGO Originals", setCount: 2, subthemeCount: 0, yearFrom: 2019, yearTo: 2019),
    ThemeFixture(theme: "LEGOLAND", setCount: 162, subthemeCount: 6, yearFrom: 1969, yearTo: 1978),
    ThemeFixture(theme: "Life of George", setCount: 2, subthemeCount: 0, yearFrom: 2011, yearTo: 2012),
    ThemeFixture(theme: "Make and Create", setCount: 44, subthemeCount: 1, yearFrom: 2005, yearTo: 2012),
    ThemeFixture(theme: "Marvel Super Heroes", setCount: 151, subthemeCount: 28, yearFrom: 2012, yearTo: 2020),
    ThemeFixture(theme: "Master Builder Academy", setCount: 17, subthemeCount: 0, yearFrom: 2011, yearTo: 2013),
    ThemeFixture(theme: "Mickey Mouse", setCount: 5, subthemeCount: 0, yearFrom: 2000, yearTo: 2000),
    ThemeFixture(theme: "Mindstorms", setCount: 68, subthemeCount: 7, yearFrom: 1998, yearTo: 2020),
    ThemeFixture(theme: "Minecraft", setCount: 59, subthemeCount: 4, yearFrom: 2013, yearTo: 2020),
    ThemeFixture(theme: "Minions: The Rise of Gru", setCount: 6, subthemeCount: 0, yearFrom: 2020, yearTo: 2020),
    ThemeFixture(theme: "Minitalia", setCount: 21, subthemeCount: 0, yearFrom: 1970, yearTo: 1977),
    ThemeFixture(theme: "Miscellaneous", setCount: 163, subthemeCount: 14, yearFrom: 2002, yearTo: 2020),
    ThemeFixture(theme: "Mixels", setCount: 90, subthemeCount: 9, yearFrom: 2014, yearTo: 2016),
    ThemeFixture(theme: "Model Team", setCount: 16, subthemeCount: 0, yearFrom: 1986, yearTo: 2004),
    ThemeFixture(theme: "Monkie Kid", setCount: 13, subthemeCount: 1, yearFrom: 2020, yearTo: 2020),
    ThemeFixture(theme: "Monster Fighters", setCount: 13, subthemeCount: 1, yearFrom: 2012, yearTo: 2012),
    ThemeFixture(theme: "Nexo Knights", setCount: 107, subthemeCount: 12, yearFrom: 2016, yearTo: 2018),
    ThemeFixture(theme: "Ninjago", setCount: 365, subthemeCount: 31, yearFrom: 2011, yearTo: 2021),
    ThemeFixture(theme: "Overwatch", setCount: 16, subthemeCount: 1, yearFrom: 2018, yearTo: 2020),
    ThemeFixture(theme: "Pharaoh's Quest", setCount: 9, subthemeCount: 0, yearFrom: 2011, yearTo: 2011),
    ThemeFixture(theme: "Pirates", setCount: 84, subthemeCount: 8, yearFrom: 1989, yearTo: 2015),
    ThemeFixture(theme: "Pirates of the Caribbean", setCount: 15, subthemeCount: 4, yearFrom: 2011, yearTo: 2017),
    ThemeFixture(theme: "Power Functions", setCount: 18, subthemeCount: 3, yearFrom: 2008, yearTo: 2013),
    ThemeFixture(theme: "Power Miners", setCount: 22, subthemeCount: 2, yearFrom: 2009, yearTo: 2010),
    ThemeFixture(theme: "Powered Up", setCount: 10, subthemeCount: 0, yearFrom: 2018, yearTo: 2020),
    ThemeFixture(theme: "PreSchool", setCount: 14, subthemeCount: 0, yearFrom: 1975, yearTo: 1978),
    ThemeFixture(theme: "Primo", setCount: 57, subthemeCount: 0, yearFrom: 1995, yearTo: 2005),
    ThemeFixture(theme: "Prince of Persia", setCount: 6, subthemeCount: 0, yearFrom: 2010, yearTo: 2010),
    ThemeFixture(theme: "Promotional", setCount: 469, subthemeCount: 16, yearFrom: 1958, yearTo: 2020),
    ThemeFixture(theme: "Quatro", setCount: 10, subthemeCount: 0, yearFrom: 2004, yearTo: 2006),
    ThemeFixture(theme: "Racers", setCount: 248, subthemeCount: 12, yearFrom: 1998, yearTo: 2013),
    ThemeFixture(theme: "Rock Raiders", setCount: 16, subthemeCount: 1, yearFrom: 1999, yearTo: 2000),
    ThemeFixture(theme: "Samsonite", setCount: 269, subthemeCount: 7, yearFrom: 1961, yearTo: 1979),
    ThemeFixture(theme: "Scala", setCount: 75, subthemeCount: 1, yearFrom: 1979, yearTo: 2001),
    ThemeFixture(theme: "Scooby-Doo", setCount: 7, subthemeCount: 0, yearFrom: 2015, yearTo: 2016),
    ThemeFixture(theme: "Seasonal", setCount: 167, subthemeCount: 10, yearFrom: 1999, yearTo: 2020),
    ThemeFixture(theme: "Serious Play", setCount: 30, subthemeCount: 0, yearFrom: 2007, yearTo: 2015),
    ThemeFixture(theme: "Service Packs", setCount: 379, subthemeCount: 16, yearFrom: 1977, yearTo: 1999),
    ThemeFixture(theme: "Space", setCount: 322, subthemeCount: 21, yearFrom: 1978, yearTo: 2015),
    ThemeFixture(theme: "Speed Champions", setCount: 41, subthemeCount: 12, yearFrom: 2015, yearTo: 2020),
    ThemeFixture(theme: "Spider-Man", setCount: 11, subthemeCount: 3, yearFrom: 2003, yearTo: 2004),
    ThemeFixture(theme: "SpongeBob SquarePants", setCount: 14, subthemeCount: 0, yearFrom: 2006, yearTo: 2012),
    ThemeFixture(theme: "Sports", setCount: 131, subthemeCount: 5, yearFrom: 2000, yearTo: 2007),
    ThemeFixture(theme: "Spybotics", setCount: 4, subthemeCount: 0, yearFrom: 2002, yearTo: 2002),
    ThemeFixture(theme: "Star Wars", setCount: 772, subthemeCount: 38, yearFrom: 1999, yearTo: 2020),
    ThemeFixture(theme: "Stranger Things", setCount: 3, subthemeCount: 0, yearFrom: 2019, yearTo: 2019),
    ThemeFixture(theme: "Studios", setCount: 55, subthemeCount: 2, yearFrom: 2000, yearTo: 2002),
    ThemeFixture(theme: "Super Mario", setCount: 31, subthemeCount: 5, yearFrom: 2020, yearTo: 2020),
    ThemeFixture(theme: "System", setCount: 433, subthemeCount: 10, yearFrom: 1949, yearTo: 1970),
    ThemeFixture(theme: "Technic", setCount: 430, subthemeCount: 9, yearFrom: 1977, yearTo: 2020),
    ThemeFixture(theme: "Teenage Mutant Ninja Turtles", setCount: 20, subthemeCount: 3, yearFrom: 2012, yearTo: 2014),
    ThemeFixture(theme: "The Angry Birds Movie", setCount: 6, subthemeCount: 0, yearFrom: 2016, yearTo: 2016),
    ThemeFixture(theme: "The Hobbit", setCount: 24, subthemeCount: 4, yearFrom: 2012, yearTo: 2014),
    ThemeFixture(theme: "The LEGO Batman Movie", setCount: 44, subthemeCount: 4, yearFrom: 2017, yearTo: 2018),
    ThemeFixture(theme: "The LEGO Movie", setCount: 33, subthemeCount: 3, yearFrom: 2014, yearTo: 2015),
    ThemeFixture(theme: "The Lego Movie 2: The Second Part", setCount: 40, subthemeCount: 3, yearFrom: 2018, yearTo: 2019),
    ThemeFixture(theme: "The LEGO Ninjago Movie", setCount: 30, subthemeCount: 3, yearFrom: 2017, yearTo: 2018),
    ThemeFixture(theme: "The Lone Ranger", setCount: 8, subthemeCount: 0, yearFrom: 2013, yearTo: 2013),
    ThemeFixture(theme: "The Lord of the Rings", setCount: 16, subthemeCount: 4, yearFrom: 2012, yearTo: 2013),
    ThemeFixture(theme: "The Powerpuff Girls", setCount: 2, subthemeCount: 0, yearFrom: 2018, yearTo: 2018),
    ThemeFixture(theme: "The Simpsons", setCount: 2, subthemeCount: 0, yearFrom: 2014, yearTo: 2015),
    ThemeFixture(theme: "Time Cruisers", setCount: 9, subthemeCount: 1, yearFrom: 1996, yearTo: 1997),
    ThemeFixture(theme: "Town", setCount: 647, subthemeCount: 35, yearFrom: 1978, yearTo: 2004),
    ThemeFixture(theme: "Toy Story", setCount: 21, subthemeCount: 4, yearFrom: 2010, yearTo: 2019),
    ThemeFixture(theme: "Trains", setCount: 207, subthemeCount: 7, yearFrom: 1966, yearTo: 2006),
    ThemeFixture(theme: "Trolls World Tour", setCount: 9, subthemeCount: 0, yearFrom: 2020, yearTo: 2020),
    ThemeFixture(theme: "Ultra Agents", setCount: 14, subthemeCount: 0, yearFrom: 2014, yearTo: 2015),
    ThemeFixture(theme: "Unikitty", setCount: 24, subthemeCount: 2, yearFrom: 2018, yearTo: 2018),
    ThemeFixture(theme: "Universal Building Set", setCount: 43, subthemeCount: 3, yearFrom: 1969, yearTo: 1987),
    ThemeFixture(theme: "Vikings", setCount: 7, subthemeCount: 0, yearFrom: 2005, yearTo: 2006),
    ThemeFixture(theme: "Western", setCount: 20, subthemeCount: 2, yearFrom: 1996, yearTo: 2002),
    ThemeFixture(theme: "World City", setCount: 38, subthemeCount: 4, yearFrom: 2003, yearTo: 2004),
    ThemeFixture(theme: "World Racers", setCount: 9, subthemeCount: 0, yearFrom: 2010, yearTo: 2010),
    ThemeFixture(theme: "Xtra", setCount: 15, subthemeCount: 0, yearFrom: 2018, yearTo: 2020),
    ThemeFixture(theme: "Znap", setCount: 20, subthemeCount: 0, yearFrom: 1998, yearTo: 1999),
]


let previewSetData = [
    BricksetSetFixture(setID: 28503, number: "21043", numberVariant: 1, name: "San Francisco", year: 2019, themeName: "Architecture", themeGroup: "Model making", subtheme: "Skylines", category: "Normal", released: true, pieces: 565, minifigs: nil, bricksetURL: "https://brickset.com/sets/21043-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 5, imageURL: "https://images.brickset.com/sets/images/21043-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/21043-1.jpg"),
    BricksetSetFixture(setID: 28502, number: "21044", numberVariant: 1, name: "Paris", year: 2019, themeName: "Architecture", themeGroup: "Model making", subtheme: "Skylines", category: "Normal", released: true, pieces: 649, minifigs: nil, bricksetURL: "https://brickset.com/sets/21044-1", rating: 5.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 5, imageURL: "https://images.brickset.com/sets/images/21044-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/21044-1.jpg"),
    BricksetSetFixture(setID: 29037, number: "21045", numberVariant: 1, name: "Trafalgar Square", year: 2019, themeName: "Architecture", themeGroup: "Model making", subtheme: "Landmark Series", category: "Normal", released: true, pieces: 1197, minifigs: nil, bricksetURL: "https://brickset.com/sets/21045-1", rating: 5.0, reviewCount: 1, packagingType: "Box", availability: "Retail - limited", instructionsCount: 2, additionalImageCount: 7, imageURL: "https://images.brickset.com/sets/images/21045-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/21045-1.jpg"),
    BricksetSetFixture(setID: 29036, number: "21046", numberVariant: 1, name: "Empire State Building", year: 2019, themeName: "Architecture", themeGroup: "Model making", subtheme: "Landmark Series", category: "Normal", released: true, pieces: 1767, minifigs: nil, bricksetURL: "https://brickset.com/sets/21046-1", rating: 5.0, reviewCount: 4, packagingType: "Box", availability: "Retail - limited", instructionsCount: 2, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/21046-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/21046-1.jpg"),
    BricksetSetFixture(setID: 29875, number: "21055", numberVariant: 1, name: "Burj Khalifa", year: 2019, themeName: "Architecture", themeGroup: "Model making", subtheme: "Landmark Series", category: "Normal", released: true, pieces: 333, minifigs: nil, bricksetURL: "https://brickset.com/sets/21055-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail - limited", instructionsCount: 1, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/21055-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/21055-1.jpg"),
    BricksetSetFixture(setID: 29744, number: "21051", numberVariant: 1, name: "Tokyo", year: 2020, themeName: "Architecture", themeGroup: "Model making", subtheme: "Skylines", category: "Normal", released: true, pieces: 547, minifigs: nil, bricksetURL: "https://brickset.com/sets/21051-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail - limited", instructionsCount: 2, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/21051-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/21051-1.jpg"),
    BricksetSetFixture(setID: 29745, number: "21052", numberVariant: 1, name: "Dubai", year: 2020, themeName: "Architecture", themeGroup: "Model making", subtheme: "Skylines", category: "Normal", released: true, pieces: 740, minifigs: nil, bricksetURL: "https://brickset.com/sets/21052-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail - limited", instructionsCount: 2, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/21052-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/21052-1.jpg"),
    BricksetSetFixture(setID: 29940, number: "21054", numberVariant: 1, name: "The White House", year: 2020, themeName: "Architecture", themeGroup: "Model making", subtheme: "Landmark Series", category: "Normal", released: true, pieces: 1483, minifigs: nil, bricksetURL: "https://brickset.com/sets/21054-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail - limited", instructionsCount: 2, additionalImageCount: 14, imageURL: "https://images.brickset.com/sets/images/21054-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/21054-1.jpg"),
    BricksetSetFixture(setID: 29778, number: "30366", numberVariant: 1, name: "Police Car", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Police", category: "Normal", released: true, pieces: 37, minifigs: 1, bricksetURL: "https://brickset.com/sets/30366-1", rating: 0.0, reviewCount: 0, packagingType: "Polybag", availability: "Retail - limited", instructionsCount: 2, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/30366-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/30366-1.jpg"),
    BricksetSetFixture(setID: 29779, number: "30367", numberVariant: 1, name: "Police Helicopter", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Police", category: "Normal", released: true, pieces: 39, minifigs: 1, bricksetURL: "https://brickset.com/sets/30367-1", rating: 4.0, reviewCount: 1, packagingType: "Polybag", availability: "Retail - limited", instructionsCount: 2, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/30367-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/30367-1.jpg"),
    BricksetSetFixture(setID: 29780, number: "30368", numberVariant: 1, name: " Fire Rescue Water Scooter", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Fire", category: "Normal", released: true, pieces: 33, minifigs: 1, bricksetURL: "https://brickset.com/sets/30368-1", rating: 4.0, reviewCount: 1, packagingType: "Polybag", availability: "Retail - limited", instructionsCount: 2, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/30368-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/30368-1.jpg"),
    BricksetSetFixture(setID: 29781, number: "30369", numberVariant: 1, name: "Beach Buggy", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: nil, category: "Normal", released: true, pieces: 45, minifigs: 1, bricksetURL: "https://brickset.com/sets/30369-1", rating: 5.0, reviewCount: 1, packagingType: "Polybag", availability: "Retail - limited", instructionsCount: 2, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/30369-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/30369-1.jpg"),
    BricksetSetFixture(setID: 30213, number: "30370", numberVariant: 1, name: "Diver", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: nil, category: "Normal", released: true, pieces: 22, minifigs: 1, bricksetURL: "https://brickset.com/sets/30370-1", rating: 0.0, reviewCount: 0, packagingType: "Polybag", availability: "Retail - limited", instructionsCount: 2, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/30370-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/30370-1.jpg"),
    BricksetSetFixture(setID: 29797, number: "40372", numberVariant: 1, name: "Police MF Accessory Set", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Police", category: "Normal", released: true, pieces: 42, minifigs: 4, bricksetURL: "https://brickset.com/sets/40372-1", rating: 3.0, reviewCount: 1, packagingType: "Blister pack", availability: "LEGO exclusive", instructionsCount: 1, additionalImageCount: 1, imageURL: "https://images.brickset.com/sets/images/40372-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/40372-1.jpg"),
    BricksetSetFixture(setID: 29431, number: "60241", numberVariant: 1, name: "Police Dog Unit", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Police", category: "Normal", released: true, pieces: 67, minifigs: 2, bricksetURL: "https://brickset.com/sets/60241-1", rating: 4.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60241-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60241-1.jpg"),
    BricksetSetFixture(setID: 29432, number: "60242", numberVariant: 1, name: "Police Highway Arrest", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Police", category: "Normal", released: true, pieces: 185, minifigs: 2, bricksetURL: "https://brickset.com/sets/60242-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 4, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60242-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60242-1.jpg"),
    BricksetSetFixture(setID: 29433, number: "60243", numberVariant: 1, name: "Police Helicopter Chase", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Police", category: "Normal", released: true, pieces: 212, minifigs: 4, bricksetURL: "https://brickset.com/sets/60243-1", rating: 3.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 6, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60243-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60243-1.jpg"),
    BricksetSetFixture(setID: 29434, number: "60244", numberVariant: 1, name: "Police Helicopter Transport", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Police", category: "Normal", released: true, pieces: 317, minifigs: 4, bricksetURL: "https://brickset.com/sets/60244-1", rating: 3.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 6, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60244-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60244-1.jpg"),
    BricksetSetFixture(setID: 29435, number: "60245", numberVariant: 1, name: "Police Monster Truck Heist", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Police", category: "Normal", released: true, pieces: 362, minifigs: 5, bricksetURL: "https://brickset.com/sets/60245-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 7, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60245-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60245-1.jpg"),
    BricksetSetFixture(setID: 29436, number: "60246", numberVariant: 1, name: "Police Station", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Police", category: "Normal", released: true, pieces: 743, minifigs: 7, bricksetURL: "https://brickset.com/sets/60246-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 12, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60246-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60246-1.jpg"),
    BricksetSetFixture(setID: 29437, number: "60247", numberVariant: 1, name: "Forest Fire", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Fire", category: "Normal", released: true, pieces: 84, minifigs: 1, bricksetURL: "https://brickset.com/sets/60247-1", rating: 4.5, reviewCount: 2, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60247-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60247-1.jpg"),
    BricksetSetFixture(setID: 29438, number: "60248", numberVariant: 1, name: "Fire Helicopter Response", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Fire", category: "Normal", released: true, pieces: 93, minifigs: 3, bricksetURL: "https://brickset.com/sets/60248-1", rating: 1.5, reviewCount: 2, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 3, imageURL: "https://images.brickset.com/sets/images/60248-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60248-1.jpg"),
    BricksetSetFixture(setID: 29439, number: "60249", numberVariant: 1, name: "Street Sweeper", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Traffic", category: "Normal", released: true, pieces: 89, minifigs: 1, bricksetURL: "https://brickset.com/sets/60249-1", rating: 5.0, reviewCount: 4, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 5, imageURL: "https://images.brickset.com/sets/images/60249-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60249-1.jpg"),
    BricksetSetFixture(setID: 29440, number: "60250", numberVariant: 1, name: "Mail Plane", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Traffic", category: "Normal", released: true, pieces: 74, minifigs: 1, bricksetURL: "https://brickset.com/sets/60250-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60250-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60250-1.jpg"),
    BricksetSetFixture(setID: 29441, number: "60251", numberVariant: 1, name: "Monster Truck", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Traffic", category: "Normal", released: true, pieces: 55, minifigs: 1, bricksetURL: "https://brickset.com/sets/60251-1", rating: 5.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60251-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60251-1.jpg"),
    BricksetSetFixture(setID: 29442, number: "60252", numberVariant: 1, name: "Construction Bulldozer", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Construction", category: "Normal", released: true, pieces: 126, minifigs: 2, bricksetURL: "https://brickset.com/sets/60252-1", rating: 5.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 4, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60252-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60252-1.jpg"),
    BricksetSetFixture(setID: 29443, number: "60253", numberVariant: 1, name: "Ice-Cream Truck", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Traffic", category: "Normal", released: true, pieces: 200, minifigs: 2, bricksetURL: "https://brickset.com/sets/60253-1", rating: 5.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 4, additionalImageCount: 5, imageURL: "https://images.brickset.com/sets/images/60253-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60253-1.jpg"),
    BricksetSetFixture(setID: 29444, number: "60254", numberVariant: 1, name: "Race Boat Transporter", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: nil, category: "Normal", released: true, pieces: 238, minifigs: 2, bricksetURL: "https://brickset.com/sets/60254-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 4, additionalImageCount: 5, imageURL: "https://images.brickset.com/sets/images/60254-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60254-1.jpg"),
    BricksetSetFixture(setID: 29445, number: "60255", numberVariant: 1, name: "Stunt Team", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: nil, category: "Normal", released: true, pieces: 62, minifigs: 2, bricksetURL: "https://brickset.com/sets/60255-1", rating: 4.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60255-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60255-1.jpg"),
    BricksetSetFixture(setID: 29446, number: "60256", numberVariant: 1, name: "Racing Cars", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Traffic", category: "Normal", released: true, pieces: 190, minifigs: 2, bricksetURL: "https://brickset.com/sets/60256-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 4, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60256-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60256-1.jpg"),
    BricksetSetFixture(setID: 29447, number: "60257", numberVariant: 1, name: "Service Station", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "General", category: "Normal", released: true, pieces: 354, minifigs: 4, bricksetURL: "https://brickset.com/sets/60257-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 8, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60257-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60257-1.jpg"),
    BricksetSetFixture(setID: 29448, number: "60258", numberVariant: 1, name: "Tuning Workshop", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "General", category: "Normal", released: true, pieces: 897, minifigs: 7, bricksetURL: "https://brickset.com/sets/60258-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 12, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60258-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60258-1.jpg"),
    BricksetSetFixture(setID: 29449, number: "60260", numberVariant: 1, name: "Air Race", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Airport", category: "Normal", released: true, pieces: 140, minifigs: 3, bricksetURL: "https://brickset.com/sets/60260-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 10, imageURL: "https://images.brickset.com/sets/images/60260-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60260-1.jpg"),
    BricksetSetFixture(setID: 29450, number: "60261", numberVariant: 1, name: "Central Airport", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Airport", category: "Normal", released: true, pieces: 286, minifigs: 6, bricksetURL: "https://brickset.com/sets/60261-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 8, additionalImageCount: 10, imageURL: "https://images.brickset.com/sets/images/60261-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60261-1.jpg"),
    BricksetSetFixture(setID: 29451, number: "60262", numberVariant: 1, name: "Passenger Aeroplane", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Airport", category: "Normal", released: true, pieces: 669, minifigs: 9, bricksetURL: "https://brickset.com/sets/60262-1", rating: 5.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 8, additionalImageCount: 14, imageURL: "https://images.brickset.com/sets/images/60262-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60262-1.jpg"),
    BricksetSetFixture(setID: 29452, number: "60263", numberVariant: 1, name: "Ocean Mini-Submarine", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Deep Sea Explorers", category: "Normal", released: true, pieces: 41, minifigs: 1, bricksetURL: "https://brickset.com/sets/60263-1", rating: 4.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 10, imageURL: "https://images.brickset.com/sets/images/60263-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60263-1.jpg"),
    BricksetSetFixture(setID: 29453, number: "60264", numberVariant: 1, name: "Ocean Exploration Submarine", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Deep Sea Explorers", category: "Normal", released: true, pieces: 286, minifigs: 4, bricksetURL: "https://brickset.com/sets/60264-1", rating: 3.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 6, additionalImageCount: 10, imageURL: "https://images.brickset.com/sets/images/60264-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60264-1.jpg"),
    BricksetSetFixture(setID: 30265, number: "60265", numberVariant: 1, name: "Ocean Exploration Base", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Deep Sea Explorers", category: "Normal", released: true, pieces: 497, minifigs: 5, bricksetURL: "https://brickset.com/sets/60265-1", rating: 4.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 8, additionalImageCount: 10, imageURL: "https://images.brickset.com/sets/images/60265-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60265-1.jpg"),
    BricksetSetFixture(setID: 29455, number: "60266", numberVariant: 1, name: "Ocean Exploration Ship", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Deep Sea Explorers", category: "Normal", released: true, pieces: 745, minifigs: 8, bricksetURL: "https://brickset.com/sets/60266-1", rating: 4.0, reviewCount: 1, packagingType: "Box", availability: "Retail", instructionsCount: 6, additionalImageCount: 10, imageURL: "https://images.brickset.com/sets/images/60266-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60266-1.jpg"),
    BricksetSetFixture(setID: 29456, number: "60267", numberVariant: 1, name: "Safari Off-Roader", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Traffic", category: "Normal", released: true, pieces: 168, minifigs: 2, bricksetURL: "https://brickset.com/sets/60267-1", rating: 4.0, reviewCount: 2, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 5, imageURL: "https://images.brickset.com/sets/images/60267-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60267-1.jpg"),
    BricksetSetFixture(setID: 29944, number: "60268", numberVariant: 1, name: "City Advent Calendar", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Seasonal", category: "Normal", released: false, pieces: nil, minifigs: nil, bricksetURL: "https://brickset.com/sets/60268-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 0, additionalImageCount: 6, imageURL: "https://images.brickset.com/sets/images/60268-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60268-1.jpg"),
    BricksetSetFixture(setID: 29457, number: "60270", numberVariant: 1, name: "Police Brick Box", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Police", category: "Normal", released: true, pieces: 301, minifigs: 4, bricksetURL: "https://brickset.com/sets/60270-1", rating: 0.0, reviewCount: 0, packagingType: "Tub", availability: "Retail", instructionsCount: 6, additionalImageCount: 4, imageURL: "https://images.brickset.com/sets/images/60270-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60270-1.jpg"),
    BricksetSetFixture(setID: 30314, number: "60271", numberVariant: 1, name: "Main Square", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Town", category: "Normal", released: false, pieces: 1517, minifigs: nil, bricksetURL: "https://brickset.com/sets/60271-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "{Not specified}", instructionsCount: 0, additionalImageCount: 20, imageURL: "https://images.brickset.com/sets/images/60271-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60271-1.jpg"),
    BricksetSetFixture(setID: 30607, number: "60272", numberVariant: 1, name: "Elite Police Boat Transport", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: nil, category: "Normal", released: true, pieces: 166, minifigs: nil, bricksetURL: "https://brickset.com/sets/60272-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 11, imageURL: "https://images.brickset.com/sets/images/60272-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60272-1.jpg"),
    BricksetSetFixture(setID: 29458, number: "60273", numberVariant: 1, name: "Elite Police Driller Chase", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: nil, category: "Normal", released: true, pieces: 179, minifigs: nil, bricksetURL: "https://brickset.com/sets/60273-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 12, imageURL: "https://images.brickset.com/sets/images/60273-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60273-1.jpg"),
    BricksetSetFixture(setID: 29459, number: "60274", numberVariant: 1, name: "Elite Police Lighthouse Capture", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: nil, category: "Normal", released: true, pieces: 189, minifigs: nil, bricksetURL: "https://brickset.com/sets/60274-1", rating: 0.0, reviewCount: 0, packagingType: "Box", availability: "Retail", instructionsCount: 2, additionalImageCount: 12, imageURL: "https://images.brickset.com/sets/images/60274-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/60274-1.jpg"),
    BricksetSetFixture(setID: 30677, number: "66636", numberVariant: 1, name: "City 2 in 1 pack", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Product Collection", category: "Collection", released: true, pieces: 129, minifigs: nil, bricksetURL: "https://brickset.com/sets/66636-1", rating: 0.0, reviewCount: 0, packagingType: "{Not specified}", availability: "{Not specified}", instructionsCount: 0, additionalImageCount: 0, imageURL: nil, thumbnailURL: nil),
    BricksetSetFixture(setID: 30678, number: "66637", numberVariant: 1, name: "City 2 in 1 pack", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Product Collection", category: "Collection", released: true, pieces: 173, minifigs: nil, bricksetURL: "https://brickset.com/sets/66637-1", rating: 0.0, reviewCount: 0, packagingType: "{Not specified}", availability: "{Not specified}", instructionsCount: 0, additionalImageCount: 0, imageURL: nil, thumbnailURL: nil),
    BricksetSetFixture(setID: 29961, number: "952001", numberVariant: 1, name: "Motorcycle Cop", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Magazine Gift", category: "Other", released: true, pieces: 14, minifigs: 1, bricksetURL: "https://brickset.com/sets/952001-1", rating: 3.0, reviewCount: 1, packagingType: "Foil pack", availability: "{Not specified}", instructionsCount: 0, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/952001-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/952001-1.jpg"),
    BricksetSetFixture(setID: 29980, number: "952002", numberVariant: 1, name: "Fireman and Drone", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Magazine Gift", category: "Other", released: true, pieces: nil, minifigs: 1, bricksetURL: "https://brickset.com/sets/952002-1", rating: 2.0, reviewCount: 1, packagingType: "Foil pack", availability: "Retail - limited", instructionsCount: 0, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/952002-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/952002-1.jpg"),
    BricksetSetFixture(setID: 30012, number: "952003", numberVariant: 1, name: "Eddy Erker with Bulldozer", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Magazine Gift", category: "Other", released: true, pieces: nil, minifigs: 1, bricksetURL: "https://brickset.com/sets/952003-1", rating: 4.0, reviewCount: 1, packagingType: "Foil pack", availability: "{Not specified}", instructionsCount: 0, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/952003-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/952003-1.jpg"),
    BricksetSetFixture(setID: 30287, number: "952005", numberVariant: 1, name: "Go-Kart and Driver", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Magazine Gift", category: "Other", released: true, pieces: 26, minifigs: 1, bricksetURL: "https://brickset.com/sets/952005-1", rating: 0.0, reviewCount: 0, packagingType: "Foil pack", availability: "Retail - limited", instructionsCount: 0, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/952005-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/952005-1.jpg"),
    BricksetSetFixture(setID: 30704, number: "952008", numberVariant: 1, name: "Jet-ski", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Magazine Gift", category: "Other", released: true, pieces: nil, minifigs: 1, bricksetURL: "https://brickset.com/sets/952008-1", rating: 0.0, reviewCount: 0, packagingType: "Foil pack", availability: "Retail - limited", instructionsCount: 0, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/952008-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/952008-1.jpg"),
    BricksetSetFixture(setID: 30191, number: "952016", numberVariant: 1, name: "Policeman and Robber", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Magazine Gift", category: "Other", released: true, pieces: nil, minifigs: 2, bricksetURL: "https://brickset.com/sets/952016-1", rating: 0.0, reviewCount: 0, packagingType: "Foil pack", availability: "Retail - limited", instructionsCount: 0, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/952016-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/952016-1.jpg"),
    BricksetSetFixture(setID: 30468, number: "952018", numberVariant: 1, name: "Harl Hubbs with Tamping Rammer", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Magazine Gift", category: "Other", released: true, pieces: nil, minifigs: 1, bricksetURL: "https://brickset.com/sets/952018-1", rating: 0.0, reviewCount: 0, packagingType: "Foil pack", availability: "Retail - limited", instructionsCount: 0, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/952018-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/952018-1.jpg"),
    BricksetSetFixture(setID: 30647, number: "952019", numberVariant: 1, name: "Scuba Diver and Shark", year: 2020, themeName: "City", themeGroup: "Modern day", subtheme: "Magazine Gift", category: "Other", released: true, pieces: 12, minifigs: 1, bricksetURL: "https://brickset.com/sets/952019-1", rating: 0.0, reviewCount: 0, packagingType: "Foil pack", availability: "Retail - limited", instructionsCount: 0, additionalImageCount: 0, imageURL: "https://images.brickset.com/sets/images/952019-1.jpg", thumbnailURL: "https://images.brickset.com/sets/small/952019-1.jpg"),
]


struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for theme in previewThemeData {
            let _ = theme.toTheme(viewContext)
        }
//        for set in previewSetData {
//            let _ = set.toBricksetSet(viewContext)
//        }
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Shared")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        
        for theme in previewThemeData {
            let _ = theme.toTheme(container.viewContext)
        }
//        for set in previewSetData {
//            let _ = set.toBricksetSet(container.viewContext)
//        }
        
        do {
            try container.viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
}
