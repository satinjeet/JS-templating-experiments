console.log 'executing test cases ::'

describe 'Template test cases Suite 1 :: simple string parsing', ->

    it 'will return me a simple string', ->

        string = '''
            <div>Simple Div</div>
        '''

        expect Template.parse string
            .toBe string