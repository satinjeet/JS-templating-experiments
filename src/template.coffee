###
    Usage
    lets say, to print a variable use, ?_ varName _?
###
class Template

    @parse: (string, data = undefined)->
        # console.log string

        ## extract JS expressions
        #
        vars = []
        variableRegex = /\?__[\ ]?(.*?)[\ ]?__\?/g
        while match = variableRegex.exec string
            string = string.replace match[0], "??#{match[1]}"
            variableRegex.lastIndex = match.index + match[1].length

        strB = string
            .replace /[\n]/g, '..'
            .replace /[\r\t\n]/g, ' '
            .replace /\?_\ ?(.*?)\ ?_\?/g, '..?$1..'
            .trim()

        strB = strB.split '..'
        for lex, i in strB
            if lex.indexOf('??') is 0
                strB[i] = lex.replace '??', ''

            else if lex.indexOf('?') is 0
                lex = lex.replace '?', ''
                strB[i] = "p.push(#{lex});"

            else
                strB[i] = "p.push('#{lex}');"

        strB.join '\n'

        # define function
        # 
        fn = new Function 'obj', "
            var p = [];
            with (obj) {
                #{strB.join '\n'}
            }
            return p.join('').trim();
        "

        console.log fn

        return if data then fn(data) else fn
