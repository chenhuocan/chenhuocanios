#  <#Title#>

# 多重Mode
- 多重模型指的是:模型之中有子模型,子模型中又有子子模型,依次类推.......


##plist解析
```objc
/********************************************************
 1> plist解析:
 以后遇到像这种复杂的plist,一层一层的往下解析.
 最终的目的就是将所有的字典转成模型.
 如果plist中字典在一个数组中,将来转出来的模型也放在一个数组中.
 也就是将字典数组转成模型数组.

 2> plist的好处:方便管理数据
 *******************************************************/
```

## 字典转模型第三方框架
- Mantle
    - 所有模型都必须继承自MTModel
- JSONModel
    - 所有模型都必须继承自JSONModel
- MJExtension
    - 不需要强制继承任何其他类


## 设计框架需要考虑的问题
- 侵入性
    - 侵入性大就意味着很难离开这个框架
- 易用性
    - 比如少量代码实现N多功能
- 扩展性
    - 很容易给这个框架增加新功能
