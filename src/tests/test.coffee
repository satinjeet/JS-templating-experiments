console.log 'executing test cases ::'
wrapperObject = @

describe 'Template test cases Suite 1 :: simple string parsing', ->

    it 'will return me a simple string', ->

        string = '''
            <div>Simple Div</div>
            <div>?_ value _? Simple Div 2</div>
        '''

        expect Template.parse(string) value: 10
            .toBe '<div>Simple Div</div><div>10 Simple Div 2</div>'

    it 'will return me a complex structure string', ->

        string = '''
            <div>
                complex Div : ?_ name _? ?_ last_name _?
                <div>Simple Div 2</div>
            <div>
        '''

        _t = Template.parse(string)
        expect _t name: 'Ass', last_name: 'Lame'
            .toBe '<div>    complex Div : Ass Lame    <div>Simple Div 2</div><div>'

    it 'declaring new var, printing it', ->
        string = '''
            ?__ someVar = 20; __?
            ?__ var someVar2 __?
            ?__ var someVar3 __?
            <h2>?_ someVar _?</h2>
        '''

        _t = Template.parse string
        expect _t {}
            .toBe '<h2>20</h2>'

describe 'Template test cases Suite 2 :: More complex structures : Arrays', ->

    it 'a simple numbered loop', ->
        string = '''
            ?__ var limit = 10; __?
            ?__ for (var i = 0; i < limit; i++) { __?
                <lame>?_ i _?</lame>
            ?__ } __?
        '''

        _t = Template.parse string
        expect _t {}
            .toBe '<lame>0</lame>    <lame>1</lame>    <lame>2</lame>    <lame>3</lame>    <lame>4</lame>    <lame>5</lame>    <lame>6</lame>    <lame>7</lame>    <lame>8</lame>    <lame>9</lame>'

    it 'loop on an array', ->
        string = '''
            ?__ arr = [0,1,2,3,4,5,6,7,8,9]; __?
            ?__ for (var i = 0; i < arr.length; i++) { __?
                <lame>?_ arr[i] _?</lame>
            ?__ } __?
        '''

        _t = Template.parse string
        expect _t {}
            .toBe '<lame>0</lame>    <lame>1</lame>    <lame>2</lame>    <lame>3</lame>    <lame>4</lame>    <lame>5</lame>    <lame>6</lame>    <lame>7</lame>    <lame>8</lame>    <lame>9</lame>'

describe 'Template test cases Suite 3 :: More complex structures : Functions', ->
    it 'passing and calling functions', ->
        string = '''
            ?_ abs(090.990) _?
        '''
        string2 = '''
            ?_ abs(-90.990) _?
        '''

        expect Template.parse(string, Math)
            .toBe '90.99'
        expect Template.parse(string2, Math)
            .toBe '90.99'


    it 'passing and calling functions, different scope', ->
        string = '''
            ?_ abs(090.990) _? ?_ Temp.myFunc() _?
        '''

        wrapperObject.Temp = 
            myFunc: ->
                return 'tmp string'

        expect Template.parse(string, Math)
            .toBe '90.99 tmp string'
