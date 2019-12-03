def Settings( **kwargs ):
    return {
        'flags': [
            '-wall',
            '-wextra',
            '-werror',
            '-wno-long-long',
            '-wno-variadic-macros',
            '-fexceptions',
            '-x',
            'c++',
            '-std=c+14'
        ]
    }
