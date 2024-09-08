class Post {
  final String title;
  final String image;
  final String author;
  final String date;
  final String description;
  final String views;
  final String likes;
  final String saves;

  Post({
    required this.description,
    required this.views,
    required this.likes,
    required this.saves,
    required this.title,
    required this.image,
    required this.author,
    required this.date,
  });
}
List<Post> posts = [
   Post(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSeoNMy3EnB4_RewVq6lpEJ84cYtDPPuKx7w&s',
    title: 'How to learn programming language',
    author: 'Mr Programmer',
    date: '24 Mar 2024',
    views: "5.6K",
    likes: "10",
    saves: "45",
    description: "Learning a programming language effectively requires a structured approach and consistent practice. Here are key steps to help you on your journey:1. Choose a Language Start with beginner-friendly languages like Python, JavaScript, or Ruby. These languages have simpler syntax and are versatile for different applications.Consider your goals: Are you interested in web development, mobile apps, or data science? Choose a language based on your interest. For example: Web development: JavaScript, HTML/CSS, PHP Mobile apps: Swift (iOS), Kotlin (Android), Flutter (Dart) Data Science: Python",
),
  Post(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvkUFmp5jSF-DhrD5102bzHU7RbidetfqYfA&s',
    title: 'Power of AI in 21st Century',
    author: 'Nabin Paudyal',
    date: '15 Mar 2024',
    views: "100k",
    likes: "8k",
    saves: "500",
    description: "Artificial Intelligence (AI) has revolutionized various sectors in the 21st century, from healthcare and education to finance and entertainment. AI’s ability to process vast amounts of data, automate repetitive tasks, and make intelligent decisions is transforming how businesses operate. Machine learning, a subset of AI, enables systems to learn from data and improve performance over time. AI-powered tools like chatbots, recommendation systems, and predictive analytics are becoming integral in personal and professional life. AI’s influence on innovation, productivity, and problem-solving will only grow as it continues to advance.",
  ),
  Post(
    image:
        'https://techcrunch.com/wp-content/uploads/2021/07/GettyImages-1207206237.jpg',
    title: 'What Deoes Google Do',
    author: 'Sundar Pichai',
    date: '11 Mar 2024',
    views: "800",
    likes: "20",
    saves: "5",
    description: "Google, one of the most influential tech companies globally, has become synonymous with search, advertising, and cloud computing. The company's search engine dominates the market, providing users with instant access to information. Google’s range of products, such as Android, YouTube, Google Maps, and Gmail, have shaped how we interact with technology daily. Additionally, Google is at the forefront of AI research, quantum computing, and cloud infrastructure. Their investments in innovation, sustainability, and user experience position them as a leader in the tech ecosystem.",
  ),
  Post(
    image:
        'https://cdn.prod.website-files.com/654366841809b5be271c8358/659efd7c0732620f1ac6a1d6_why_flutter_is_the_future_of_app_development%20(1).webp',
    title: 'Why You Need to Learn Flutter',
    author: 'Nabin Ji',
    date: '25 Mar 2024',
    views: "10K",
    likes: "100",
    saves: "50",
    description: "Flutter, Google’s open-source UI toolkit, allows developers to build beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Learning Flutter can drastically speed up the app development process due to its rich set of pre-designed widgets, fast development cycles with Hot Reload, and the ability to deploy across multiple platforms simultaneously. As demand for cross-platform applications increases, mastering Flutter can provide a significant edge in the tech job market. The vibrant community and constant updates from Google make Flutter a strong choice for both beginners and experienced developers.",
  ),
  Post(
    image:
        'https://ciracollege.com/wp-content/uploads/2020/11/How-to-Learn-Python.jpg',
    title: 'Why Python programming is the future?',
    author: 'Bhuwan Khadka',
    date: '25 Mar 2024',
    views: '10K',
    likes: '100',
    saves: '50',
    description: "Python’s simplicity, readability, and versatility make it one of the most popular and future-proof programming languages. It is widely used in AI, machine learning, web development, data analysis, and automation. Python’s extensive libraries and frameworks, such as TensorFlow, Django, and Pandas, allow developers to create scalable and robust applications quickly. Its role in emerging technologies like AI, data science, and IoT further cements its position as a language for the future. Python's widespread adoption across industries and its thriving community ensure its relevance for years to come.",
  ),
  Post(
    image:
        'https://www.simplilearn.com/ice9/free_resources_article_thumb/What_is_the_Importance_of_Technology.jpg',
    title: 'The Importance of Technology',
    author: 'Pawan Acharya',
    date: '12 Feb 2024',
    views: '15K',
    likes: '200',
    saves: '75',
    description: 'Technology is at the heart of human progress in the 21st century. It enhances productivity, innovation, communication, and problem-solving capabilities across various domains. From cloud computing and artificial intelligence to the Internet of Things (IoT), technology has transformed industries such as healthcare, education, finance, and entertainment. Businesses leverage technology to streamline operations, gain competitive advantages, and provide better customer experiences. For individuals, technology improves quality of life, offers convenience, and enables lifelong learning. Staying updated with technological advancements is crucial for both professional and personal growth.',
  ),
  Post(
    image:
        'https://profiletree.com/wp-content/uploads/2023/02/technology-3.webp',
    title: 'A Guide to Selecting a Technology System: 5 simple steps for your business to follow',
    author: 'Luxman Bhattarai',
    date: '01 Jan 2024',
    views: '8K',
    likes: '120',
    saves: '40',
    description: 'Identify Business Needs: Understand the specific challenges and opportunities that technology can address within your business.Research Technology Solutions: Explore different software, hardware, and platforms to find solutions that align with your goals.Evaluate Costs and ROI: Consider the cost of implementation and maintenance, as well as the potential return on investment.Pilot Test the System: Run a small-scale test of the system to ensure it fits your needs before full deployment.Train Your Team: Ensure your staff is trained and equipped to use the technology effectively for seamless integration into operations.',
  ),
  Post(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOF0tsbj9zIiMenMAf81DNnrKrFY2eJs2eLA&s',
    title: 'How to Study Effectively - Useful Study Tips',
    author: 'Pawan Dhakal',
    date: '18 Aug 2024',
    views: '20K',
    likes: '300',
    saves: '150',
    description: 'The importance of emotional intelligence in leadership.',
  ),
  Post(
    image:
        'https://media.licdn.com/dms/image/D4D12AQHYMV-Gp_b_tA/article-cover_image-shrink_600_2000/0/1682173923429?e=2147483647&v=beta&t=xzc3wX2uvob0jciPlk9yZcPtILjK6aFgzdNEl08OvM0',
    title: 'Building a Growth Mindset',
    author: 'Sara Lee',
    date: '05 May 2024',
    views: '12K',
    likes: '90',
    saves: '60',
    description: 'A growth mindset is the belief that intelligence and abilities can be developed through hard work, persistence, and learning. People with a growth mindset view challenges as opportunities for growth, embrace failure as a learning experience, and constantly seek to improve. Developing a growth mindset involves focusing on personal progress, seeking feedback, and maintaining a positive attitude toward learning. In today’s fast-paced world, having a growth mindset is crucial for adapting to change, overcoming obstacles, and achieving long-term success.',
  ),
  Post(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ84uh0fj3X3-g6qkCyKOWkJ6BPygHbkm0K0g&s',
    title: 'The Science of Sleep',
    author: 'Rachel Green',
    date: '09 Oct 2021',
    views: '18K',
    likes: '250',
    saves: '100',
    description:
        'Understanding the role of sleep in mental and physical health.',
  ),
  Post(
    image:
        'https://imageio.forbes.com/specials-images/imageserve/646b09c56ffa41bec1a2e237/15-Habits-To-Achieve-A-Better-Work-Life-Balance-In-Today-s-Fast-Paced-World/960x0.jpg?height=473&width=711&fit=bounds',
    title: 'Achieving Work-Life Balance',
    author: 'David Warner',
    date: '22 Nov 2023',
    views: '9K',
    likes: '110',
    saves: '55',
    description:
        'Practical strategies for maintaining a healthy work-life balance.',
  ),
  Post(
    image:
        'https://builtin.com/sites/www.builtin.com/files/2022-07/future-artificial-intelligence.png',
    title: 'The Future of Artificial Intelligence',
    author: 'Elon Tech',
    date: '30 Jun 2021',
    views: '25K',
    likes: '400',
    saves: '200',
    description: 'The future of AI holds immense potential across all sectors, from healthcare and education to transportation and entertainment. With advancements in machine learning, natural language processing, and robotics, AI will continue to automate tasks, augment human abilities, and improve decision-making processes. AI-driven innovations like autonomous vehicles, personalized medicine, and intelligent virtual assistants will reshape industries and create new job opportunities. However, the ethical implications of AI, such as job displacement and data privacy, will require careful consideration as we move forward.',
  ),
  Post(
    image:
        'https://insights.masterworks.com/wp-content/uploads/2022/11/IMG_5069-1-1024x586.jpg',
    title: 'The Art of Minimalism',
    author: 'Mark Twain',
    date: '17 Apr 2024',
    views: '7K',
    likes: '50',
    saves: '30',
    description:
        'Minimalism is a lifestyle philosophy centered around simplifying life by reducing material possessions and focusing on experiences and relationships. The minimalist approach encourages living with less, eliminating distractions, and valuing what truly matters. Minimalism promotes clarity, mental space, and the freedom to focus on personal growth and fulfillment. By adopting minimalist principles, individuals can reduce stress, save money, and cultivate a deeper sense of purpose and happiness in everyday life.',
  ),
  Post(
    image:
        'https://examstudyexpert.com/wp-content/uploads/2022/11/Benefits-of-meditation-featured-image.jpg',
    title: 'The Benefits of Meditation',
    author: 'Linda Monroe',
    date: '15 Jul 2024',
    views: '22K',
    likes: '350',
    saves: '170',
    description:
        'Meditation offers numerous physical, mental, and emotional benefits. Regular practice reduces stress, enhances concentration, and improves emotional well-being by promoting mindfulness. Meditation has been scientifically proven to lower blood pressure, improve sleep quality, and boost immune function. It also helps increase self-awareness and fosters a sense of inner peace. In today’s high-paced, technology-driven world, meditation provides a powerful tool for individuals to cultivate mental clarity, emotional balance, and overall well-being.',
  ),
];

// all the source code is in description