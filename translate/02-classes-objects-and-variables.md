# Classes, Objects, and Variables

通过我们之前已经证明的例子，你应该知道我们曾说 Ruby 是一门面向对象的语言。所以这章就是为了说明这个论断的。我们会一起学习如何使用 Ruby 创建一个类和对象，而且对比一下 Ruby 在此方面比其他语言优秀的地方。按着这个方向，我们会实现网络版爵士蓝调音乐盒这个价值斐然产品的部分功能。

经过几个月的努力之后，我们的研发人员确定音乐盒产品需要歌曲。所以看起来歌曲是一个适合以 Ruby 的类进行表现的事物，也是这个产品的一个好开端。我们也知道，真正的歌曲应该有名称，作者以及时长，因此我们将要确保在我们的程序里也是这样的。

我们会开始创建一个基础类 `Song`（就像我们在第 9 页提起的那样，类名需要以一个大写字符开头，而方法名以一个小写字符开头），并且类中只有一个方法 `initialize`。

```ruby
class Song
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
  end
end
```

`initialize` 在 Ruby 程序中是一个特殊方法。当你调用 `Song.new` 时就是在创建一个新的 `Song` 对象，Ruby 先创建一个未初始化的对象然后再调用对象的 `initialize` 方法，以调用 `new` 方法时的参数作为入参。这样就给你一个可以通过编写代码的方式初始一个对象的状态。

对于 `Song` 类，`initialize` 方法有三个参数。这些参数对于方法来说就如同局部变量，因此我们也按照局部变量的规则命名，以小写字母开头。

每个对象都表示一首歌，因此我们需要每个 `Song` 对象都了解自己的歌名，作者和时长。这意味着我们需要把这些值在对象中作为实例变量储存起来。在 Ruby 中，一个实例变量的命名方式以 `@` 符号开头。在我们的例子中，`name` 参数被赋值给了 `@name` 实例变量，`artist` 被赋值给 `@artist`，`duration` （一首歌的时长秒数）赋值给了 `@duration`。

让我们测试一个这个新类。

```ruby
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.inspect » "#<Song:0x401b4924 @duration=260, @artist=\"Fleck\", @name=\"Bicylops\">"
```

看起来新类是正常的。通常 `inspect` 存储对象的 id 和实例变量，它在所有对象中都存在。上面的例子看起来我们已经正确地将对象初始化了。

我们的经验告诉我们，在开发过程中，我们需要频繁地打印 `Song` 对象的内容，并且 `inspect` 已经对我们需要的内容进行了格式化。幸运的是，Ruby 中有一个标准信息通过 `to_s` 获得，它也出现在任何对象中，并且把对象以字符串的形式输出。让我们试一试。

```ruby
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.to_s  » "#<Song:0x401b499c>"
```

这并不是太有用，它只是获得了对象的 id。因此让我们重写 `to_s` 方法。当我们进行此工作前，我们也应该花点时间在书中讲一下我们对类的定义。

在 Ruby 中，类永远不会关闭。你可以给一个已经存在的类添加方法。这适用于你写的类以及内部类。所以你必须开放你已经写好的类的定义，你指定的新内容也会被添加至任意地方。

这对于我们的目标是有好处的。在我们完成这个章节时，当添加一个功能给类时，我们需要为新方法展示这个类的定义。旧的也依然在。它让我们必须在每个例子中重复多余的内容。显然，如果你只是以草稿的方式编写这些代码，你可能会把所有这些方法都置于一个类中。

细节已经补充完毕。让我们回到为 `Song` 类添加 `to_s` 方法这件事情。

```ruby
class Song
  def to_s
    "Song: #{@name}--#{@artist} (#{@duration})"
  end
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.to_s  » "Song: Bicylops--Fleck (260)"
```

很棒，你完成了这个部分。然而，我们还有些地方有瑕疵。我们说 Ruby 所有的对象都支持 `to_s` 方法，但是我们没有说是怎样做到的。这个答案需要和继承，子类，以及当你改善信息给对象时应该调用哪个方法有关。这是一个新的章节，所以...

## 继承和信息

继承允许你创建一个类，这个类可以对其他类进行细化或特殊化处理。例如，我们的音乐盒有一个歌曲的概念，我们封装为 `Song` 类。然后市场部告诉我们，我们需要支持卡拉OK。一首卡拉OK 歌曲和其他歌曲一样（卡拉OK 歌曲应该是只有背景音的，但现在我们暂时不关注这点）。但是它和歌词是联动的，以及伴随时速信息。当我们的音乐盒播放一首卡拉OK 歌曲时，歌词应该在音乐盒前面的屏幕上滚动，并伴随着音乐。

解决这个问题的一种方式是定义一个新类，叫做 `KaraokeSong`，就如同 `Song` 一样，并且增加歌词轨道。

```ruby
class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end
end
```

`< Song` 就是告诉 Ruby `KaraokeSong` 是 `Song` 的一个子类。（意料之中，这就是意味着 `Song` 是 `KaraokeSong` 的超类。人们也经常谈论父子关系，因此 `KaraokeSong` 的父类就是 `Song`。）现在不需要太过于关心 `initialize` 方法，关于里面的 `super` 的使用会在后面讲到。

让我们创建一个 `KaraokeSong` 对象，然后检查一下它是否正常。（在最终的系统里，歌词将会被一个对象封装，其中包含文本和时速信息。因此测试我们的类时我们会使用一个字符串）。无类型语言在此时有一个好处，我们在开始运行代码前不需要定义每个东西。

```ruby
aSong = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
aSong.to_s  » "Song: My Way--Sinatra (225)"
```

虽然程序正常运行了，但是为什么 `to_s` 没有显示歌词呢？

这个问题的答案和在你传递信息给一个对象时，Ruby 决定哪个方法应该被调用的方式有关。当 Ruby 编译 `aSong.to_s` 方法的调用时，它并不知道应该在哪里找到 `to_s` 方法。于是，它在程序运转期间将这个决断推迟。与此同时，它发现了 `aSong` 的类。如果这个类实现了一个相同名字的方法，那这个方法就会被运行。如果不是，Ruby 会在父类中寻找，然后在父类的父类中寻找，一直向上查找整个继承链。如果查找了整个继承链依然没有查到对应的方法，它会采取一个特殊动作，一般情况下是抛出一个错误。（实际上，你可以拦截这个错误，在运行时拦截掉这个错误后允许你做一个虚拟方法。这会在 355 页去讨论。）

现在回到我们刚才的例子中。我们发送信息给 `aSong` 的 `to_s` 方法，`aSong` 的类是 `KaraokeSong`。Ruby 在 `KaraokeSong` 中查找 `to_s` 方法，但没有找到它。然后解释器继续在 `KaraokeSong` 的父类 `Song` 中查找，这时它找到了我们之前在 `Song` 中定义的 `to_s` 方法。这就是为什么打印了歌曲的详情，但没有打印歌词的原因，因为 `Song` 并不知道任何有关歌词的信息。

让我们通过实现 `KaraokeSong#to_s` 方法处理掉这个问题。有许多方法都可以完成这个任务。让我们先用一种最差的方式进行。我们会从 `Song` 中拷贝 `to_s` 方法，并且把歌词加上。

```ruby
class KaraokeSong
  # ...
  def to_s
    "KS: #{@name}--#{@artist} (#{@duration}) [#{@lyrics}]"
  end
end
aSong = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
aSong.to_s  » "KS: My Way--Sinatra (225) [And now, the...]"
```

我们明确地展示了 `@lyrics` 实例变量的值。为了做到这点，子类直接访问了它的实例变量。但为什么这是一种差的实现 `to_s` 的方法呢？

答案必须联系好的程序风格讨论（有时也叫做解耦）。我们自己实现的方式是通过访问它父类的内部状态完成的。如果我们把歌曲时长以毫秒存储。`KaraokeSong` 就会输出一些奇怪的数据值。这个修改会导致卡拉OK 的《My Way》这首歌最后会显示时长为 3750 分钟，想想就觉得可怕。

我们应该只让每个类操作自己的内部状态来解决这个问题。当 `KaraokeSong#to_s` 被调用时，我们会调用到它父类的 `to_s` 方法，以此获取歌曲的详情。然后再附上歌词信息，并将结果返回。在 Ruby 中这个技巧涉及关键词 `super`。当你调用 `super` 而不传入参数时，Ruby 会传递一个信息给当前对象的父类，让它调用与当前方法名字一样的方法，并且把传递到当前方法的参数传递过去。现在我们可以用新的方式实现 `to_s` 方法了。

```ruby
class KaraokeSong < Song
  # Format ourselves as a string by appending
  # our lyrics to our parent's #to_s value.
  def to_s
    super + " [#{@lyrics}]"
  end
end
aSong = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
aSong.to_s  » "Song: My Way--Sinatra (225) [And now, the...]"
```

我们明确地告诉 Ruby，`KaraokeSong` 是 `Song` 的子类，但我们没有为 `Song` 指定父类。如果你没有在定义一个类的时候指定父类，Ruby 会指定 `Object` 类为默认的父类。这意味着所有的对象都是以 `Object` 作为祖先，而且 `Object` 的实例方法对每个 Ruby 中的对象都是可用的。这也是之前我们讲 `to_s` 方法对所有对象都可用的原因，`to_s` 是 `Object` 中超过 35 个实例方法中的一个。`Object` 中完整的实例方法列表在 351 页。

### 继承和 Mixins

一些面向对象语言（特别是 C++）都支持多继承的方式，也就是一个类可以有超过一个的直接父类，并且从每个父类继承特性。尽管非常有用，但这种技术比较危险，这样会使继承体系变得模糊。

其他的语言，例如 Java，只支持单继承。也就是一个类只有一个直系的父类。尽管很清晰（更加容易实现），但单继承也有缺点，因为现实世界中的事物通常是从多个事物来继承属性（例如一个球既是可跳跃的，也是球状的）。

Ruby 提供了一种有趣又有用的折中方案，给你一个简洁的单继承并且也给你有用的多继承。一个 Ruby 类只有一个直接的父类，因此 Ruby 是一个单继承语言。然而，Ruby 类也可以包含任意多的 mixin 的特性（mixin 就像一个局部类的定义）。这提供了一种类似多继承的能力，可以克服相应的缺点。我们会在 98 页讨论更多关于 mixin 的内容。

这一节我们已经讲述了很多关于类和类方法的内容。现在让我们继续了解对象，比如 `Song` 实例。

## 对象和属性

我们前面创建的 `Song` 对象已经有了一些内部状态（比如歌名和作者）。这些状态对于对象是私有的，没有任何一个其他对象能够访问另一个对象的实例参数。一般情况下，这是件好事情。这意味着对象只需要维护自身的一致性就好。

然而，一个对象完全充满秘密是没用的，你只能创建它，但你不能用它做任何事情。通常你会定义方法用于维护和访问对象的状态，允许外部世界与对象进行协作。这些对象对外的东西被称为 `attributes`。

对于 `Song` 对象，我们比较需要的第一个能力就是获取标题和作者（为了在播放歌曲时能够展示），以及歌曲的时长（为了能够显示流程工具条）。

```ruby
class Song
  def name
    @name
  end
  def artist
    @artist
  end
  def duration
    @duration
  end
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.artist    » "Fleck"
aSong.name      » "Bicylops"
aSong.duration  » 260
```

我们定义了三个访问器方法，用于访问三个实例参数。因为这是一种公共习惯，所以 Ruby 提供了一种方便的简写：`attr_reader`，可以用这个简写创建这些访问器方法。

```ruby
class Song
  attr_reader :name, :artist, :duration
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.artist    » "Fleck"
aSong.name      » "Bicylops"
aSong.duration  » 260
```

这个例子讲解了一些新东西。`:artist` 这种结构是一种表达式，它能够返回与 `artist` 一致的 `Symbol`。你可以认为 `:artist` 和变量 `artist` 名字的意义是一样的，而不是简单地认为就是变量 `artist` 的值。在这个例子中，我们命名了访问方法 `name`，`artist` 和 `duration`。这和实例参数 `@name`，`@artist` 及 `@duration` 被自动创建的访问方法是一样的。这些访问方法和我们简单手写的也是一样的。

### 可写属性

有时你需要在外部能够设置一个对象的属性。例如，歌曲的时长只是初始时分配给了一首歌曲（或者作为一个 CD 或者 MP3 的数据是收集一起的）。第一次我们播放歌曲时，我们了解到这首歌实际时长是多少，我们把这个数值存储到 `Song` 对象。

在 C++ 和 Java 中，你可以通过 `setter` 方法实现。

```java
class JavaSong {                     // Java code
  private Duration myDuration;
  public void setDuration(Duration newDuration) {
    myDuration = newDuration;
  }
}
s = new Song(....)
s.setDuration(length)
```

在 Ruby 中，一个对象的属性作为其它变量也是可以被访问的。我们前面部分见到过，例如 `aSong.name`。因此，当你想要设置这个属性的值时，就像你可以自然地把这些参数分配给这些变量。而根据最少惊喜原则，Ruby 也是这样做的。

```ruby
class Song
  def duration=(newDuration)
    @duration = newDuration
  end
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.duration  » 260
aSong.duration = 257   # set attribute with updated value
aSong.duration  » 257
```

`aSong.duration = 257` 调用了 `aSong` 对象中的 `duration=` 方法，通过这个方法 257 被设置给了 `aSong` 对象的 `@duration`。实际上，命名一个方法时以等号结束，会使方法名非常适合出现在赋值操作的左侧。

接下来，Ruby 提供了一个创建属性最基本的赋值方法的快捷方式。

```ruby
class Song
  attr_writer :duration
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.duration = 257
```

### 虚拟属性

这些属性访问的方法并不是都需要使用一个实例变量包裹。例如，你可能想要通过分钟的形式访问歌曲时长，而不是像之前一样通过秒的形式。

```ruby
ass Song
  def durationInMinutes
    @duration/60.0   # force floating point
  end
  def durationInMinutes=(value)
    @duration = (value*60).to_i
  end
end
aSong = Song.new("Bicylops", "Fleck", 260)
aSong.durationInMinutes         » 4.333333333
aSong.durationInMinutes = 4.2
aSong.duration                  » 252
```

我们使用了一个属性方法创建了一个虚拟实例变量。对于外部世界，`durationInMinutes` 看起来和其他属性一样。但从内部来看和其他的实例变量并不一样。

这种方式很特别。在 Betrand Meyer 的里程碑书籍《Object-Oriented Software Construction》中，他称这种方式为 *Uniform Access Principle*。通过隐藏不同实例变量和计算值之间的不同，你将你在类中实现的部分对外部世界屏蔽。你可以自由修改你功能的动作方式，而不必担忧外部使用你类的大量代码。这是一个巨大的好处。

## 类变量和类方法

到目前为止，我们已经创建了包含实例变量和实例方法的对象，实例变量被分配给特定的类实例，而实例方法运用这些变量进行运转。有时，类需要有自己的状态。这也是类变量存在的原因。

### 类变量

一个类变量可以在所有类的对象间共享，同时也可以被类方法访问。不过类变量只是一个类指定类变量的拷贝。类变量以两个
`@@` 符号开头，比如
`@@count`。和全局变量以及实例变量不同，类变量必须在被使用之前初始化。通过都是在类定义的体内进行初始化。

例如，我们的点唱机可能想要记录每首歌被播放了多少次。次数记录可能是使用一个
`Song`
对象的实例变量。当一首歌被播放，实例中的值就增加。但是我们也想要了解总共有多少首歌被播放。我们可以通过搜寻
`Song`
对象并累加他们的播放次数达到目的，或者我们可以不考虑好的设计，直接使用全局变量完成。但是我们也是可以使用类变量。

```ruby
class Song
  @@plays = 0
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays    = 0
  end
  def play
    @plays += 1
    @@plays += 1
    "This  song: #@plays plays. Total #@@plays plays."
  end
end
```

为了能够断点，我们让 `Song#play`
方法返回了一个包含次数的字符串，这其中也有所有歌曲播放的总次数。这样我们就可以容易进行测试。

```ruby
s1 = Song.new("Song1", "Artist1", 234)  # test songs..
s2 = Song.new("Song2", "Artist2", 345)
s1.play     »"This  song: 1 plays. Total 1 plays."
s2.play     »"This  song: 1 plays. Total 2 plays."
s1.playlay  »"This  song: 2 plays. Total 3 plays."
s1.play     »"This  song: 3        plays. Total 4 plays."
```

类变量被提供给了一个类和它的实例。如果你需要让它能够被外部访问，你需要写一个访问方法。这些方法也可以是一个实例方法，也可以整洁一些制作为一个类方法。

### 类方法

有时候，一个类需要提供一些用于指定对象的方法。

我们已经使用过这样的方法。`new` 方法创建了一个新 `Song`
对象，但并不是它自身分配了一个指定的歌曲。

```ruby
aSong = Song.new(....)
```

你会发现类方法散布在 Ruby 的库中。例如，类 `File`
的对象通过由文件系统支持的方式打开文件。然而，`File`
类也提供了几个类方法，用于操作因无法打开的而没有生成 `File`
对象的文件。如果你想要删除一个文件，你调用类方法 `File.delete`
并且传参文件名就可以完成。

```ruby
File.delete("doomedFile")
```

类方法的定义与实例方法是有区别的。类方法是通过类名替代定义，并且有一个点符号在方法名之前。

```ruby
class Example

  def instMeth              # instance method
  end

  def Example.classMeth     # class method
  end

end
```

点唱机需要为每首歌的播放进行收费，而不是通过时长。这样的方式就使短歌比长的歌更加盈利。我们可能想要阻止
`SongList` 中太长的歌曲可以播放。我们可以在 `SongList`
定义一个类方法，用来检查一首歌是否已经超过了长度限制。我们会通过一个类常量设置长度限制，就如同一般的常量（常量以大写字符开头）一样在类体中定义。

```ruby
class SongList
  MaxTime = 5*60           #  5 minutes
  def SongList.isTooLong(aSong)
    return aSong.duration > MaxTime
  end
end
song1 = Song.new("Bicylops", "Fleck", 260)
SongList.isTooLong(song1)                        »false
song2 = Song.new("The Calling", "Santana", 468)
SongongList.isTooLong(song2)                     »true
```

### 单例和其他构造器

有时你想要重写 Ruby
中默认创建对象的方式。就如同这个例子，让我们继续看看点唱机。因为我们将会有许多点唱机，遍布于世界各地，我们需要便捷的方式维护它们。有部分需求是记录发生在每个点唱机中的事情，包括播放的歌曲，收取的钱，奇怪的液体沷向它等等。因为我们需要为音乐预留网络带宽，我们将在本地存储日志文件。这意味着我们需要一个类来归置日志。然而，我们只是想要每个点唱机都有一个日志对象，我们需要这些对象能在其它对象需要时被分享。

根据需要我们可以使用设计模式中的单例模式。我们只通过一种方式创建一个日志对象，就是通过调用
`Logger.create`，并且我们需要保证只有一个日志对象被创建。

通过将 `Logger` 的 `new`
方法私有化，我们阻止任何人通过一般的构造方法创建日志对象。取而代之的是，我们提供一个类方法，`Logger.create`。并且使用类变量
`@@logger`
保持日志单一实例的引用，当每次被调用时返回实例。（我们此处实现的单例模式不是线程安全的，如果多线程运行时可能创建多个日志实例。我们可以将它改造为线程安全的，然而，我们需要使用
Ruby 中的 `Singleton` mixin，这个内容在 468
页进行介绍）。我们可以通过查看方法返回的通过唯一码进行检查。

```ruby
Logger.create.object_id  » 47128750937760
Logger.create.object_id  » 47128750937760
```

使用类方法作为伪构造方法也可以使你创建的类的使用者更容易操作。作为一个不太重要的例子，让我们看看类
`Shape` 表示一个常规的多边形。`Shape`
的实例可以通过所需的边数和和周长进行构造。

```ruby
class Shape
  def initialize(numSides, perimeter)
    # ...
  end
end
```

然而，一些年后，这些类有不同的应用，程序员需要通过名字创建图形，并且还有边长而不是周长。可以为
`Shape` 添加一些类方法。

```ruby
class Shape
  def Shape.triangle(sideLength)
    Shape.new(3, sideLength*3)
  end
  def Shape.square(sideLength)
    Shape.new(4, sideLength*4)
  end
end
```

这些都是许多类方法的应用，但只是探索类方法并不会让我们的点唱机尽快完成，所以让我们继续学习。

## 访问控制

当进行一个类接口设计时，考虑你将会向外界暴露类中有多少内容可以被访问是很重要的。如果你允许在暴露过多的类被访问的内容，容易提高应用的耦合性。你类的使用者被引诱过度依赖类的实现细节，而不是逻辑接口。好消息是，在
Ruby
中只有一种方法可以改变类状态，就是通过调用它的一个方法。对方法的访问控制也就是你要控制被访问的对象。一个好的经验法则是不让一个对象暴露能够让无效状态脱离对象的方法。Ruby 给了我们三个级别的保护。

  - **Public methods（公共方法）**
    能够被任何对象调用，就如同没有访问控制。方法默认都是公共的，除了
`initialize` 方法外，因为 `initialize` 方法是私有的。
  - **Protected methods（受保护方法）**
    只能被定义的类和其子类调用。访问被控制在家族内。
  - **Private methods（私有方法）**
    不能被其他接收器访问。因为使用这类方法时不能指定对象，私有方法只能在定义类时调用，以及在同一个对象中直接调用。

`protected` 和 `private`
之间的差异很小，并且这种差异不仅存在于 Ruby
中，同时也存在于众多面向对象语言中。如果一个方法是受保护的，它可能被任何此类或者其子类的实例调用。如果一个方法是私有的，它只能在对象的上下文中被调用，直接访问其它对象的私有方法也不可能，即使是由同一个类创建的对象也不可能。

Ruby
在其他重要的地方和其他面向对象语言还有不同之处。当一个程序运转时，访问控制是可以动态决定的，而还是静态的。如果你访问一个受限的方法，你只是会得到一个访问方法的阻碍。

### 指定访问控制

你在一个类或模块的定义中为方法指定一个或多个访问级别时，可以使用
`public`，`protected` 和
`private`。每个函数都有两种不同的使用方式。

如果是无传参的情况，可以直接在函数之后定义方法。如果你是一个 C++ 或者
Java 程序员，你会觉得这个种使用方式很熟悉，就如同 `public`
等关键字是一样的效果。

```ruby
class MyClass

      def method1    # default is 'public'
        #...
      end

  protected          # subsequent methods will be 'protected'

      def method2    # will be 'protected'
        #...
      end

  private            # subsequent methods will be 'private'

      def method3    # will be 'private'
        #...
      end

  public             # subsequent methods will be 'public'

      def method4    # and this will be 'public'
        #...
      end
end
```

还有另一种方式，你可以将需要设置访问控制的方法名如同传参一样，在访问控制函数后列举相应方法的名字。

```ruby
class MyClass

  def method1
  end

  # ... and so on

  public    :method1, :method4
  protected :method2
  private   :method3
end
```

类的 `initialize` 方法自动被声明为私有的。

是时候举一些例子了。或许我们需要为账户系统建模，这个系统需要每次借记都有相应的贷记。因为你需要确认没有人破坏这个规则，我们会把借记和贷记的方法声明为私有的，并且定义我们的外部接口用于完成流程。

```ruby
class Accounts

  private

    def debit(account, amount)
      account.balance -= amount
    end
    def credit(account, amount)
      account.balance += amount
    end

  public

    #...
    def transferToSavings(amount)
      debit(@checking, amount)
      credit(@savings, amount)
    end
    #...
end
```

受保护访问是在当对象需要访问同一个类的其它对象内部状态时使用。例如，我们可能想要具体的
`Account`
对象能够原始地比较它们的平衡值，但对于外部世界又需要隐藏这些平衡值（可能因为我们需要用一个不同的方式表现他们）。

```ruby
ass Account
  attr_reader :balance       # accessor method 'balance'

  protected :balance         # and make it protected

  def greaterBalanceThan(other)
    return @balance > other.balance
  end
end
```

因为属性 `balance` 是受保护的，所以在 `Account`
对象中是可用的。

## 变量

现在我们创建了很多对象，让我们来确认一下我们没有丢失掉它们。变量可以用来跟踪对象，每个变量都是与对象的关联。

让我们确认一下代码。

```ruby
person = "Tim"
person.object_id    »  537771100
person.class        »  String
person              »  "Tim"
```

第一行 Ruby 创建了一个新的 `String` 对象，并且值是 `Tim`。通过
`person`
局部变量关联对象。一个快速检验变量是否如上所说的办法就是确认它的字符串值，以及通过对象
id，类型和值。

所以变量是对象吗？

在 Ruby
中答案是「不是」。一个变量只是对象的一个引用。对象漂浮在一个巨大的水池中（大多数时候是在堆中），并且由变量指向它们。

让我们做一个复杂一点的例子。

```ruby
person1 = "Tim"
person2 = person1
person1[0] = 'J'
person1  »"Jim"
person2  »"Jim"Tim
```

到底发生了什么？我们修改了 `person1` 的第一个字符，但是 `person1` 和
`person2` 都从 「Tim」改变为了「Jim」。

实际上，变量只是保留了对象的引用，并不是对象本身。将 `person1`
赋值给
`person2` 时并没有创建新对象，只是简单地将 `person1`
的对象引用拷贝给了 `person2`，因此 `person1` 和 `person2`
都指向了相同的对象。我们会 31 页展示相应的图示。

分配对象别名，也就是可能将对象的引用分配赋值给多个变量。但这样不会导致代码出现问题吗？其实会出问题，但和你平时想象的并不一样（例如，在
Java 中的对象以一样的方式运转）。实际上在 3.1
例图的相应例子中，你可以通过 `String` 的 `dup`
方法避免别名，会创建一个拥有相同值的 `String` 新对象。

```ruby
person1 = "Tim"
person2 = person1.dup
person1[0] = "J"
person1  »"Jim"
person2  »"Tim"person1
```

你也可以通过冻结对象的方式阻止其他人修改指定对象（我们会在 251
页具体讨论冻结对象）。如果对已经冻结的对象进行修改，在 Ruby 中会被抛出
`TypeError` 异常。

```ruby
person1 = "Tim"
person2 = person1
person1.freeze       # prevent modifications to the object
person2[0] = "J"
```

结果是

```ruby
prog.rb:4:in `=': can't modify frozen string (TypeError)
from prog.rb:47128750937760
```

****

> 本文翻译自《Programming Ruby》，主要目的是自己学习使用，文中翻译不到位之处烦请指正，如需转载请注明出处
>
> 本章原文为 [Classes, Objects, and Variables](https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html)

