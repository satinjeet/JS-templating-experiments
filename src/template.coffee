###
    Usage
    lets say, to print a variable use, ?_ varName _?
###
class Template

    @parse: (string)->
        console.log string

        strB = string
            .replace /[\r\t\n]/g, ' '
            .replace /\?_(.*?)_\?/g, '\' + $1 + \''
        strB = "'#{strB}'"

        # define function
        # 
        fn = new Function 'obj', "
            var result = \"\";
            with (obj) {
                result = #{strB};
            }
            return result;
        "

        console.log fn

        return fn
