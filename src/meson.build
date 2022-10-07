src_files = [
]

header_files = [
]

libproject = both_libraries('project', src_files, install: true)
install_headers(header_files, subdir: 'project')

libproject_dep = declare_dependency(
  sources: [src_files, header_files],
  link_with: libproject,
  include_directories: include_directories('.'),
)

girgen_feature = get_option('girgen')
girgen = girgen_feature.enabled() or girgen_feature.auto()

if girgen
  libproject_gir = gnome.generate_gir(libproject,
    sources: header_files,
    namespace: 'project',
    identifier_prefix: 'Trb',
    symbol_prefix: 'trb',
    extra_args: [
      '--quiet',
      '--c-include=project.h',
      '--accept-unprefixed',
    ],
    export_packages: pkg_api_name,
    nsversion: apiversion,
    install: true,
    install_dir_gir: girdir,
  )
endif
