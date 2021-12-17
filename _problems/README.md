# downloading old problem sets

problem descriptions:

```shell
echo "1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25" | xargs -tI @ bash -c "sleep 5; curl https://adventofcode.com/2017/day/@ > 2017day@.html"
```

personalized inputs: requires grabbing a session token:

```shell
echo "1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25" | xargs -tI @ bash -c "sleep 5; curl -H 'Host: adventofcode.com' -H 'Cookie: session=53616c7465645f5fc8e2d5b3504b2a6f3fa8a29c8f3aa9ac28ba25b979e6949411d87ed3f60fb10dd7a15a102440a133' --compressed 'https://adventofcode.com/2019/day/@/input' > 2019Day@Input.txt"
```
