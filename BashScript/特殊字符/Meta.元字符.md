

### 元字符（特殊字符 Meta）

shell 除了有通配符之外，由shell 负责预先先解析后，将处理结果传给命令行之外，shell还有一系列自己的其他特殊字符。

| `字符` | 说明                                                                   |
| ------ | ---------------------------------------------------------------------- |
| `IFS`  | 由 `<space>` 或 `<tab>` 或 `<enter>` 三者之一组成 ( 我们常用 space )。 |
| `CR`   | 由 `<enter>` 产生。                                                    |
| `=`    | 设定变量。                                                             |
| `$`    | 作变量或运算替换 (请不要与 shell prompt 搞混了)。                      |
| `>`    | 重导向 stdout。 *                                                      |
| `<`    | 重导向 stdin。 *                                                       |
| `|`    | 命令管道。 *                                                           |
| `&`    | 重导向 file descriptor ，或将命令置于背境执行。 *                      |
| `( )`  | 将其内的命令置于 nested subshell 执行，或用于运算或命令替换。 *        |
| `{ }`  | 将其内的命令置于 non-named function 中执行，或用在变量替换的界定范围。 |
| `;`    | 在前一个命令结束时，而忽略其返回值，继续执行下一个命令。 *             |
| `&&`   | 在前一个命令结束时，若返回值为 true，继续执行下一个命令。 *            |
| `||`   | 在前一个命令结束时，若返回值为 false，继续执行下一个命令。 * |
| `!`    | 执行 history 列表中的命令。*                                           |

加入 "*" 都是作用在命令名直接。可以看到shell 元字符，基本是作用在命令上面，用作多命令分割（或者参数分割）。因此看到与通配符有相同的字符，但是实际上作用范围不同。所以不会出现混淆。

以下是man bash 得到的英文解析：
```
metacharacter
    A character that, when unquoted, separates words.  One of the following:
    |  & ; ( ) < > space tab
control operator
    A token that performs a control function.  It is one of the following symbols:
    || & && ; ;; ( ) | <newline> 
```


