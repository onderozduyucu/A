// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:mobx_codegen/builder.dart' as _i2;
import 'package:json_serializable/builder.dart' as _i3;
import 'package:source_gen/builder.dart' as _i4;
import 'package:auto_route_generator/builder.dart' as _i5;
import 'package:build_resolvers/builder.dart' as _i6;
import 'dart:isolate' as _i7;
import 'package:build_runner/build_runner.dart' as _i8;
import 'dart:io' as _i9;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
    r'mobx_codegen:mobx_generator',
    [_i2.storeGenerator],
    _i1.toDependentsOf(r'mobx_codegen'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'json_serializable:json_serializable',
    [_i3.jsonSerializable],
    _i1.toDependentsOf(r'json_serializable'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'source_gen:combining_builder',
    [_i4.combiningBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'source_gen:part_cleanup'],
  ),
  _i1.apply(
    r'auto_route_generator:auto_route_generator',
    [_i5.autoRouteBuilder],
    _i1.toDependentsOf(r'auto_route_generator'),
    hideOutput: true,
  ),
  _i1.apply(
    r'auto_route_generator:auto_router_module_generator',
    [_i5.autoRouterModuleBuilder],
    _i1.toDependentsOf(r'auto_route_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'auto_route_generator:auto_router_generator',
    [_i5.autoRouterBuilder],
    _i1.toDependentsOf(r'auto_route_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'build_resolvers:transitive_digests',
    [_i6.transitiveDigestsBuilder],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
  ),
  _i1.applyPostProcess(
    r'source_gen:part_cleanup',
    _i4.partCleanup,
  ),
];
void main(
  List<String> args, [
  _i7.SendPort? sendPort,
]) async {
  var result = await _i8.run(
    args,
    _builders,
  );
  sendPort?.send(result);
  _i9.exitCode = result;
}
