console.log 'executing test cases ::'

describe 'Template test cases Suite 1 :: simple string parsing', ->

    it 'will return me a simple string', ->

        string = '''
            <div>Simple Div</div>
            <div>?_ value _? Simple Div 2</div>
        '''

        expect Template.parse(string) value: 10
            .toBe '<div>Simple Div</div> <div>10 Simple Div 2</div>'

    it 'will return me a complex structure string', ->

        string = '''
            <div>
                complex Div : ?_ name _? ?_ last_name _?
                <div>Simple Div 2</div>
            <div>
        '''

        _t = Template.parse(string)
        expect _t name: 'Ass', last_name: 'Lame'
            .toBe '<div>     complex Div : Ass Lame     <div>Simple Div 2</div> <div>'

    it 'declaring new var, printing it', ->
        string = '''
            ?__ someVar = 20_?
            ?__ someVar2 _?
            ?__ someVar3 _?
            <h2>?_ someVar _?</h2>
        '''

        _t = Template.parse string
        expect _t {}
            .toBe '<h2>20</h2>'
