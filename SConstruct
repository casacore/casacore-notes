import os

AddOption('--prefix',
          dest='prefix',
          nargs=1, type='string',
          default = "/tmp/doc/notes",
          action='store',
          metavar='DIR',
          help='installation prefix')
env = Environment( ENV = { 'PATH' : os.environ[ 'PATH' ],
                           'HOME' : os.environ['HOME'] },
                   PREFIX = GetOption('prefix')
                   )
env.SConscript("SConscript",variant_dir="doc_build", exports=["env"])
