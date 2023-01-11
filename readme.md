# hessian

## [grain](https://grain-lang.org/) streams inspired by javascript callbags

> 🌾 A standard for callbacks that enables lightweight observables and iterables

![](./banner.jpg)

Photo by <a href="https://unsplash.com/@clemono?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Clem Onojeghuo</a> on <a href="https://unsplash.com/photos/Nd93qsjX71k?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>

> WIP still being built!

# Usage

```javascript
import * from "./hessian"
import * from "./types"
import { (|>) } from "./pipe"

let producer = fromList([1, 2, 3]) |> map(v => v + 10)

let operators = producer |> map(v => v + 10) |> map(v => v + 10)

operators |> forEach(print)
```

```shell
31
32
33
```

```javascript
// serialise.gr
...
record Human {
  mut message: String,
}

let value = { message: "Hi from Bob", }
print(Bytes.toString(marshal(value)))
```

```javascript
// deserialise.gr
...
let stdinOptions = {
  file: Fd(File.stdin),
  rwFlags: [],
  size: 1024,
}: Sources.ReadFileOptions

let deserialise = message => {
  let parsed = Result.map((bob: Human) => bob.message, unmarshal(message))
  Result.toOption(parsed)
}

readFile(stdinOptions)  |>
  map(Bytes.fromString) |>
  map(deserialise) |>
  forEach(print)
```

```shell
grain serialise | grain deserialise
```

```shell
Some("Hi from Bob")
```
