###
    Usage
    lets say, to print a variable use, ?_ varName _?
###
class Template

    @parse: (string)->
        console.log string

        ## extract variable definitions
        #
        vars = []
        variableRegex = /\?__[\ ]?(.*?)[\ ]?_\?/g
        while match = variableRegex.exec string
            vars.push match[1]

        strB = string
            .replace variableRegex, ''
            .replace /[\r\t\n]/g, ' '
            .replace /\?_(.*?)_\?/g, '\' + $1 + \''
            .trim()
        strB = "'#{strB}'"


        # prepare variables
        
        if vars.length
            vars = "var #{vars.join ','};"
        else
            vars = ''

        # define function
        # 
        fn = new Function 'obj', "
            var result = \"\";
            with (obj) {
                #{vars}
                result = #{strB};
            }
            return result;
        "

        console.log fn

        return fn
