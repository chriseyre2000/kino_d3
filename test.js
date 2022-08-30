JSON.stringifyIt = (obj)=>{
    return(
        JSON.stringify(obj, function(key, value) {
            if (typeof value === "function") {
                return "/Function(" + value.toString() + ")/";
            }
            if(typeof value === "string"){
                return "/String(" + value.toString() + ")/"
            }
            return value;
        })
    )
}
JSON.parseIt=(json)=>{
    return(
        JSON.parse(json, function(key, value) {
            if (typeof value === "string" &&
            value.startsWith("/Function(") &&
            value.endsWith(")/")) {
                value = value.substring(10, value.length - 2);
                var string = value.slice(value.indexOf("(") + 1, value.indexOf(")"));
                if(/\S+/g.test(string)){
                    return (new Function(string,value.slice(value.indexOf("{") + 1, value.lastIndexOf("}"))))

                }else{
                    return (new Function(value.slice(value.indexOf("{") + 1, value.lastIndexOf("}"))));
                }
                
            }
            if (typeof value === "string" &&
            value.startsWith("/String(") &&
            value.endsWith(")/")){
                value = value.substring(8, value.length - 2);
            }
            return value;
        })
    )
}

console.log(JSON.stringifyIt( (svg) => { svg.append('line').style("stroke", "lightgreen").style("stroke-width", 10).attr("x1", 0).attr("y1", 0).attr("x2", 200).attr("y2", 200);})
)
