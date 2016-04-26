# A JS templating experiment

*written in coffeescript*

A simple parser function to read the string and create javascript templating function.

usage: 
```
# syntax: coffeescript
string = '''
    <div>Simple Div</div>
    <div>?_ value _? Simple Div 2</div>
'''
_t = Template.parse string
html = _t value: 10
```

will return

``` <div>Simple Div</div><div>10 Simple Div 2</div> ```


```
# syntax: coffeescript
string = '''
    <div>Simple Div</div>
    ?__ for ( var i = 0; i < 5; i++) { __?
        <i>?_ i _?</i>
    ?__ } __?
'''
_t = Template.parse string
html = _t()
```

will return

``` <div>Simple Div</div> <i>0</i> <i>1</i> <i>2</i> <i>3</i> <i>4</i>```

sample use cases can be found in src/tests in `coffeescript` and dist/tests in `javascript`.