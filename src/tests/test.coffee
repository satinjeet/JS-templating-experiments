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
