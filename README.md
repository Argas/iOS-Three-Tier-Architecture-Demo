# SOA Demo project

- [x] SOA: Presentaion, Service and Core layers
- [x] Dependency injection
- [x] Network layer

This is SOA Demo project. All files are decomposed into Presentation, Service and Core layers.

![N|Solid](https://github.com/Argas/10923748/blob/master/ReadmeFiles/SOA.png)

### Presenation layer 
It consists of one Demo screen. The Demo screen is desiged using MVC pattern.

![N|Solid](https://github.com/Argas/10923748/blob/master/ReadmeFiles/MVC.png)

### Dependency injection
Each module has `ModuleAssembly` file, which injects all dependencies into module, makes a dependencies graph.
All modules assemblies are created in `RootAssembly.swift`

### Network layer
There is a `IRequestSender` that sends request.
Request is represented by `RequestConfig<T>` class, that has 
  - `IRequest` - object that has url, parameters, headers and so on.
  - `Parser<T>` - parser, that recieves `Data` object and returns PONSO model
  - `<T>` - type of PONSO model
  
All services work with **IRequestSender** and `RequestConfig<T>`'s only.

All configs are declared in `RequestsFactory`

