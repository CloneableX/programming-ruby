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

****

> 本文翻译自《Programming Ruby》，主要目的是自己学习使用，文中翻译不到位之处烦请指正，如需转载请注明出处
>
> 本章原文为 [Classes, Objects, and Variables](https://ruby-doc.com/docs/ProgrammingRuby/html/tut_classes.html)
