project('project', 'c',
  version: '1.0.0',
  default_options: [
    'buildtype=debugoptimized',
    'warning_level=3',
    'c_std=gnu2x',
    'girgen=disabled',
    'gi_docgen=disabled',
  ],
  license: 'MIT'
)

version_arr = meson.project_version().split('.')

apiversion = '@0@.0'.format(version_arr[0])
libversion = meson.project_version()

pkg_api_name = '@0@-@1@'.format(meson.project_name(), apiversion)

cc = meson.get_compiler('c')
cc_args = []

if cc.get_id() == 'gcc'
  cc_args += [
    '-pipe',
    '-Wduplicated-branches',
    '-funsigned-char',
    '-Wimplicit-fallthrough',
    '-Wmisleading-indentation',
    '-Wunused',
    '-Wno-pedantic',
    '-Wno-format-zero-length',
    '-Wimplicit',
    '-Werror=format=2',
    '-Wno-format-nonliteral',
    '-Werror=init-self',
    '-Werror=missing-include-dirs',
    '-Werror=pointer-arith',
    '-Wstrict-prototypes',
    '-Werror=implicit-function-declaration',
  ]
elif cc.get_id() == 'clang'
  cc_args += [
    '-gcodeview',
    '-pipe',
    '-funsigned-char',
    '-Wimplicit-fallthrough',
    '-Wmisleading-indentation',
    '-Wunused',
    '-Wno-pedantic',
    '-Wno-format-zero-length',
    '-Wimplicit',
    '-Werror=format=2',
    '-Wno-format-nonliteral',
    '-Werror=init-self',
    '-Werror=missing-include-dirs',
    '-Werror=pointer-arith',
    '-Wno-strict-prototypes',
    '-Werror=implicit-function-declaration',
  ]
endif

add_project_arguments(cc.get_supported_arguments(cc_args), language: 'c')

datadir = get_option('datadir')
libdir  = get_option('libdir')
girdir  = get_option('datadir') / 'gir-1.0'

gnome = import('gnome')

subdir('src')
subdir('doc')
subdir('test')

pkg_config = import('pkgconfig')
pkg_config.generate(
  libraries: libproject,
  version: libversion,
  filebase: pkg_api_name,
  name: 'Project',
  description: 'Some C library',
)
