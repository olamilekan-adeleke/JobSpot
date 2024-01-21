//
//  Models.swift
//  JobSpot
//
//  Created by Enigma Kod on 21/01/2024.
//

import Foundation

// MARK: - Characters

struct Character {
    enum SideType: String {
        case light = "Light"
        case dark = "Dark"
        case unknown = "Unknown"
    }

    var name: String
    var side: SideType
    var image: String
}

extension Character {
    static var exampleList: [Character] {
        let char01 = Character(name: "Harry Potter", side: .light, image: "harryPotter")
        let char02 = Character(name: "Lord Voldemort", side: .dark, image: "lordVoldemort")
        let char03 = Character(name: "Hermione Granger", side: .light, image: "hermioneGranger")
        let char04 = Character(name: "Severus Snape", side: .dark, image: "severusSnape")

        return [char01, char02, char03, char04]
    }
}

// MARK: - KLocation

struct KLocation {
    var name: String
    var description: String
    var image: String
}

extension KLocation {
    static var harryPotterLocations: [KLocation] {
        let location1 = KLocation(
            name: "Hogwarts School of Witchcraft and Wizardry",
            description: """
                Hogwarts School of Witchcraft and Wizardry is a magical school located in a castle, hidden from the non-magical world. It serves as the primary setting for the Harry Potter series. The school is known for its impressive architecture, magical staircases, and various enchanted creatures. Students at Hogwarts learn about magic, attend classes, and engage in various magical activities.
            """,
            image: "hogwartsImage"
        )

        let location2 = KLocation(
            name: "Diagon Alley",
            description: """
                Diagon Alley is a hidden wizarding shopping street in London, accessible to witches and wizards through the Leaky Cauldron. It is a bustling and magical place where one can find a variety of shops selling everything from magical wands and broomsticks to magical creatures and spellbooks. Diagon Alley is an essential stop for every young witch or wizard preparing for the school year at Hogwarts.
            """,
            image: "diagonAlleyImage"
        )

        let location3 = KLocation(
            name: "The Forbidden Forest",
            description: """
                The Forbidden Forest is a dense and dangerous woodland located on the Hogwarts School grounds. It is off-limits to students, and its name suggests the presence of numerous magical creatures and mysterious dangers. Despite its dangers, the Forbidden Forest plays a significant role in the Harry Potter series, serving as the setting for various important events and encounters.
            """,
            image: "forbiddenForestImage"
        )

        let location4 = KLocation(
            name: "Gringotts Wizarding Bank",
            description: """
                Gringotts Wizarding Bank is the only known bank in the wizarding world and is run by goblins. Located in Diagon Alley, it is a highly secure institution where wizards and witches store their money and valuable possessions. Gringotts is known for its deep vaults, guarded by various magical creatures, and the use of intricate keys and vault carts to access the stored treasures.
            """,
            image: "gringottsImage"
        )

        return [location1, location2, location3, location4]
    }
}

// MARK: - kCourse

struct KCourses {
    var name: String
    var description: String
    var image: String
}

extension KCourses {
    static var harryPotterCourses: [KCourses] {
        let course1 = KCourses(
            name: "Potions",
            description: """
                Potions is a magical discipline that involves the creation of various magical mixtures, elixirs, and brews. In this course, students at Hogwarts learn the art and science of combining different magical ingredients to produce specific effects. Professor Severus Snape is known for his expertise in teaching Potions, and the subject is a vital component of a wizard's education.
            """,
            image: "potionsImage"
        )

        let course2 = KCourses(
            name: "Defense Against the Dark Arts",
            description: """
                Defense Against the Dark Arts is a crucial subject at Hogwarts, focusing on the defense against dark creatures and the dark arts. Throughout the series, this course has been taught by various professors, each facing their unique challenges. Students learn how to defend themselves against dark creatures, curses, and other magical threats, preparing them for the dangers they might encounter.
            """,
            image: "defenseAgainstDarkArtsImage"
        )

        let course3 = KCourses(
            name: "Transfiguration",
            description: """
                Transfiguration is the magical art of changing the form or appearance of an object. Taught by Professor Minerva McGonagall, this challenging course requires skill and precision. Students learn to transform objects into other objects and, at an advanced level, even change their own form. Transfiguration is a fundamental aspect of magical education and is used in various magical fields.
            """,
            image: "transfigurationImage"
        )

        let course4 = KCourses(
            name: "Herbology",
            description: """
                Herbology is the study of magical plants and fungi. Taught by Professor Pomona Sprout, this course covers the care and magical properties of various plants. Students learn to cultivate, harvest, and use magical plants in different potions and spells. Herbology plays a crucial role in the wizarding world's magical ecosystem and is essential for potion-making and magical research.
            """,
            image: "herbologyImage"
        )

        return [course1, course2, course3, course4]
    }
}
