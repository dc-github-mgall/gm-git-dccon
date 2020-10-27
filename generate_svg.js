const Octicons = require("@primer/octicons");
const fs = require("fs").promises;
const childProcess = require("child_process");

async function writeImg(prop) {
    const svgPath = `icons/${prop.name}.svg`;
    const pngPath = `output/icon_${prop.name}.png`;

    await fs.writeFile(svgPath, prop.toSVG({ width: 100, xmlns: "http://www.w3.org/2000/svg" }));
    childProcess.spawnSync("resvg", ["--background", "white", svgPath, pngPath]);
}

async function run() {
    const props = [Octicons.star, Octicons["star-fill"], Octicons["git-fork"]];

    for (const prop of props) {
        await writeImg(prop);
    }
}

run()
