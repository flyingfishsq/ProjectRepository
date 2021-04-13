class Post {
  final String title, author, imageUrl, description;

//注意构造方法的定义
  Post(
      {required this.title,
      required this.author,
      required this.imageUrl,
      required this.description});

  bool selected = false;
}

final List<Post> posts = [
  Post(
    title: 'Candy Shop',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705155897-iRq7d32M74_650-675.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'Childhood in a picture',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705160870-2k053G9SN5_583-639.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'Contained',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705166457-z4k6dZV9d8_646-682.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'Dragon',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705171734-K48LAO1822_641-694.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'Free Hugs',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705176626-Xm4XFSyb58_673-710.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'Gravity Falls',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705176626-Xm4XFSyb58_673-710.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'Icecream Truck',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705181423-42722267O5_649-672.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'keyclack',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705194211-3g77w3DI2f_400-400.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'Overkill',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705194211-3g77w3DI2f_400-400.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'Say Hello to Barry',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705212847-ZoV4Xu22qv_400-400.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'Space Skull',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'http://piccn.ihuaben.com/pic/chapter/201912/0715/1575705226416-502sR5693X_400-400.jpeg?x-oss-process=image/resize,w_640',
  ),
  Post(
    title: 'The Old Fashioned',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607593181100&di=c5de11e32b7c59567eef27012f1ffd5c&imgtype=0&src=http%3A%2F%2Fpiccn.ihuaben.com%2Fpic%2Fchapter%2F201912%2F0715%2F1575705204023-Yrvt6ap03c_400-400.jpeg',
  ),
  Post(
    title: 'Tornado',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607593181088&di=4bddac1e11dd6b539f4df40dc92ef5bd&imgtype=0&src=http%3A%2F%2Fpiccn.ihuaben.com%2Fpic%2Fchapter%2F201912%2F0715%2F1575705189462-856d6Ug9mb_400-400.jpeg',
  ),
  Post(
    title: 'Undo',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607593181085&di=571a25e0671a030b766b1ee3008a10a0&imgtype=0&src=http%3A%2F%2Fpiccn.ihuaben.com%2Fpic%2Fchapter%2F201912%2F0715%2F1575705217311-2m14p7w92m_400-400.jpeg',
  ),
  Post(
    title: 'White Dragon',
    author: 'Mohamed Chahin',
    description:
        'Esse ut nulla velit reprehenderit veniam sint nostrud nulla exercitation ipsum. Officia deserunt aliquip aliquip excepteur eiusmod dolor. Elit amet ipsum labore sint occaecat dolore tempor officia irure voluptate ad. Veniam laboris deserunt aute excepteur sit deserunt dolor esse dolor velit sint nulla anim ut. Reprehenderit voluptate adipisicing culpa magna ea nulla ullamco consectetur. Cupidatat adipisicing consequat adipisicing sit consectetur dolor occaecat.',
    imageUrl:
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607593181085&di=61337a58822189d02b62863933047790&imgtype=0&src=http%3A%2F%2Fpiccn.ihuaben.com%2Fpic%2Fchapter%2F201912%2F0715%2F1575705221921-ntU96094r6_400-400.jpeg',
  )
];
