# PlistHelper
iOS .plist helper class

#### Use

##### Get .plist

```Swift
if let arr = helper.getPlist(name: "deneme") as? [String] {
        print(arr)
    }
```

##### Decode & Encode .plist

```Swift
  class UserModel: Codable {
     var name:String!
     var surname:String!
     var age:Int!
  }

  let model = UserModel()
  model.name = "Kenan"
  model.surname = "Atmaca"
  model.age = 23

  helper.writePlist(to: "mrb.plist", encode: model) { (flag) in
      print(flag)
  }
```

```Swift
let docPlist = helper.getDocPlist(to: "mrb.plist", decode: UserModel())
print(docPlist?.name)
```

## License
Usage is provided under the [MIT License](http://http//opensource.org/licenses/mit-license.php). See LICENSE for the full details.
