function customLog(v, i) {
    var args = [v];
    if(i != null && i.customParams != null) args = args.concat(i.customParams);
    console.log.apply(console,args);
}