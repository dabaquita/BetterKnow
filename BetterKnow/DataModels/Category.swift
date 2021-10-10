//
//  Categories.swift
//  BetterKnow
//
//  Created by Denielle Abaquita on 10/9/21.
//

import UIKit

class Category {
    var title: String = ""
    var image: UIImage
    var topics: [Topic]
    
    init(title: String, image: UIImage, topics: [Topic]) {
        self.title = title
        self.image = image
        self.topics = topics
    }
    
    // Implement this and return our categories holding various topics
    static func FetchCategories() -> [Category] {
        return [
           Category(
            title: "General Information",
            image: UIImage(systemName: "book")!,
            topics: [Topic(title: "How can I use distractions to manage difficult thoughts or feelings?", description: "     Anyone can post anything online. It's up to the readers to think critically about information to decide if it seems helpful, truthful, or safe. Here are key points to keep in mind as you determine which information is worth considering and which information doesn't pass the test.\n     It's so easy to spread information online, and we can't assume that the source we're reading or watching is the original source. Before you can evaluate anything, you need to know where the claims come from and determine if it's a reliable source.\n     Reliable sources on the coronavirus and COVID-19 illness include the World Health Organization (WHO), Government of Canada ministries and agencies like Health Canada and the Public Health Agency of Canada, the Government of BC ministries and agencies like the BC Ministry of Health, and the BC Centre for Disease Control (BCCDC). Scientists and researchers at universities and other institutions and health sciences professionals are also important sources of information.\n     Read the entire story or post before you make any decisions\nHeadlines and titles need to be simple and short, so they can sometimes be misleading on their own. They may also be purposefully shocking or controversial to entice you to click to read more\n     Look at the author\n Websites that belong to governments, government-funded agencies, well-known health providers, universities, or groups of medical professionals are generally the most reliable. Be careful of sites that don't list the author or don't tell you much about themselves. Double-check the author and the credentials of any 'experts' quoted or cited to see if they are actually experts in the topic being discussed.\n     See what other sources say\n Can you find other evidence from other sources to support the claims? Does the author list their sources? Are the sources legitimate, like research journals?"),
                     Topic(title: "How can I tell if health information is good or bad?", description: "insert article information here"),
                     Topic(title: "How can I take care of my physical health?", description: "insert info here"),
                     Topic(title: "How can I maintain social connections? What if I fell lonely?", description: "info here"),
                     Topic(title: "How can I manage grief?", description: "information here"),
                     Topic(title: "How can I reframe the situation and find more balanced perspectives?", description: "My book"),]
           ),
           Category(
            title: "Finding Help",
            image: UIImage(systemName: "book.fill")!,
            topics: [Topic(title: "Eat", description: "My book")]
           ),
           Category(
            title: "Support",
            image: UIImage(systemName: "book.closed")!,
            topics: [Topic(title: "Eat", description: "My taco")]
           ),
           Category(
            title: "Understanding systems and treatments",
            image: UIImage(systemName: "pills")!,
            topics: [Topic(title: "Eat", description: "My pills")]
           )
        ]
    }
}
