gi_docgen_feature = get_option('gi_docgen')
gi_docgen = girgen_feature.enabled()

if girgen and gi_docgen
  config_data = configuration_data()
  config_data.set('VERSION', libversion)

  libproject_toml = configure_file(
    input: 'libproject.toml.in',
    output: 'libproject.toml',
    configuration: config_data,
  )

  gidocgen = find_program('gi-docgen')

  docsdir = datadir / 'doc'

  custom_target('libproject-doc',
    input: [libproject_toml, libproject_gir[0]],
    output: 'libproject-@0@'.format(apiversion),
    command: [
      gidocgen,
      'generate',
      '--quiet',
      '--config=@INPUT0@',
      '--output-dir=@OUTPUT@',
      '--no-namespace-dir',
      '@INPUT1@',
    ],
    build_by_default: true,
    install: true,
    install_dir: docsdir,
  )
endif
