# hessian

## [grain](https://grain-lang.org/) streams inspired by javascript callbags

> 🌾 A standard for callbacks that enables lightweight observables and iterables

![](./banner.jpg)

Photo by <a href="https://unsplash.com/@clemono?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Clem Onojeghuo</a> on <a href="https://unsplash.com/photos/Nd93qsjX71k?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>

# Usage

```javascript
import * from "./index"
import * from "./types"

let producer = pipe2(
  fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]),
  map(v => v + 10)
)
let operators = pipe3(
  producer, 
  map(v => v + 10), 
  map(v => v + 10)
)

pipe2(
  operators, 
  forEach(print)
)
```

```shell
31
32
33
34
35
36
37
38
39
40
41
```
