# default[:files]= ['bla','test']

default[:config]={
    :work_space => {
        :base_path => ENV["MY_WORKSPACE_PS"],
        :ps_extension => '.ps1',
        :pester_convention_naming => 'Tests',
        :ps_files => [
            'serviceValidator'
        ]
    }
}