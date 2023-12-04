# AdventOfCode

My solutions to challenges at https://adventofcode.com.

# Top-level operations

This is generally the order of operations each year to prepare for the next competition.

- `make init` to set up the dev env.
- `make update` to ensure all available years are scaffolded and available days' descriptions and inputs are filled in, and the generated Xcode project is up to date. (Currently doesn't work in terminal, must run the `update` scheme in the Xcode project.)
    - Make sure to grab a valid session cookie from the website and put it into the environment variable for the `update` scheme.
- `make test` to run the tests for all years present.

# Files

Each year has a directory containing a directory for each day. Each day directory contains Description.swift, which has the problem text, sample and real inputs.

Part 1 and 2 implementations have their own files.

Each problem (with very few exceptions) is defined as an raw String value enums, with cases as input, and part 1 and 2 as computed vars in extensions in their files. These are all compiled into a static library target per year.

Tests are compiled into a test target per year. Benchmarks are in yet another test target.

All the implementation and test sources are colocated in each day directory, like so: 

 ```
 path/
 ├── aoc<year>/
 │   ├── Info.plist (for the test targets)
 │   ├── Day1/
 │   │   ├── Day01Description.swift
 │   │   ├── Day01Part1.swift
 │   │   ├── Day01Part2.swift
 │   │   ├── Day01Tests.swift
 │   │   └── Day01Benchmarks.swift
 │   ├── Day2/
 │   │   ├── Day02Description.swift
 ...
 ```

# Stats

## 2022

```
      --------Part 1---------   --------Part 2---------
Day       Time    Rank  Score       Time    Rank  Score
 11   01:10:02    6750      0   02:40:17    7479      0
 10   00:18:36    3593      0   01:07:40    7089      0
  9   01:01:03    8471      0          -       -      -
  8   00:29:07    5342      0   00:51:41    5302      0
  7   01:04:31    6524      0   01:18:56    6678      0
  6   00:22:18   12147      0   00:25:48   11609      0
  5       >24h  103783      0       >24h  101842      0
  4       >24h  117004      0       >24h  115070      0
  3       >24h  120806      0       >24h  115098      0
  2       >24h  151777      0       >24h  145485      0
  1       >24h  185359      0       >24h  178595      0
```

## 2021

```
      --------Part 1--------   --------Part 2--------
Day       Time   Rank  Score       Time   Rank  Score
 17   01:50:31   5833      0   02:07:09   5298      0
 15   00:27:00   1695      0          -      -      -
 14   00:59:24   8040      0          -      -      -
 13   21:10:07  34709      0   21:21:29  33905      0
 11       >24h  44267      0          -      -      -
 10       >24h  52166      0          -      -      -
  9       >24h  59074      0          -      -      -
  8   00:51:01  10513      0          -      -      -
  7   00:09:52   4373      0   01:08:34  11772      0
  6   00:12:48   4327      0   04:43:58  20005      0
  5   00:39:14   5335      0   01:13:28   6136      0
  4   01:04:05   6342      0   01:12:35   5371      0
  3   00:42:26  12148      0   01:42:56  10475      0
  2   00:08:12   5780      0   00:10:03   4108      0
  1   00:06:13   3537      0   00:13:50   3589      0
```

## 2020

```
      --------Part 1--------   --------Part 2--------
Day       Time   Rank  Score       Time   Rank  Score
 16       >24h  31456      0          -      -      -
 15       >24h  33987      0       >24h  32208      0
 14       >24h  35093      0       >24h  31373      0
 13       >24h  39860      0          -      -      -
 12   02:20:50   8656      0   02:50:24   7568      0
 11   05:00:11  14620      0   06:25:24  12774      0
 10   00:24:31   6520      0          -      -      -
  9   01:46:01  11662      0   02:09:14  11202      0
  8   01:10:59  10016      0   03:52:22  15177      0
  7   04:23:47  15030      0          -      -      -
  6       >24h  52028      0       >24h  50428      0
  5       >24h  64038      0       >24h  62869      0
  4       >24h  60438      0       >24h  64277      0
  3       >24h  73385      0       >24h  71097      0
  2       >24h  84617      0       >24h  82236      0
  1       >24h  75019      0       >24h  70168      0
```
