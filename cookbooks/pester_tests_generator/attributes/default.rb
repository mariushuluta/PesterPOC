# default[:files]= ['bla','test']

default[:config]={
    :work_space => {
        :base_path => ENV["MY_WORKSPACE_PS"],
        :ps_extension => '.ps1',
        :ps_files => [
            'serviceValidator'
        ]
    }
}