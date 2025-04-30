<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art Live</title>
    <style>
        body {
            font-family: monospace;
            background: #f0f0f0;
            padding: 20px;
        }
        input {
            width: 100%;
            padding: 10px;
            font-size: 18px;
        }
        textarea {
            width: 100%;
            height: 180px;
            font-family: monospace;
            font-size: 16px;
            margin-top: 10px;
            background: #fff;
        }
    </style>
</head>
<body>

<h2>Générateur ASCII Art (Live)</h2>
<input type="text" id="textInput" placeholder="Tape ici ton texte (ex: LE)">
<textarea id="asciiOutput" readonly></textarea>

<script>
    const asciiArt = {
        A: [" #  ", "# # ", "### ", "# # ", "# # "],
        B: ["##  ", "# # ", "##  ", "# # ", "##  "],
        C: [" ## ", "#   ", "#   ", "#   ", " ## "],
        D: ["##  ", "# # ", "# # ", "# # ", "##  "],
        E: ["### ", "#   ", "##  ", "#   ", "### "],
        F: ["### ", "#   ", "##  ", "#   ", "#   "],
        G: [" ## ", "#   ", "# # ", "# # ", " ## "],
        H: ["# # ", "# # ", "### ", "# # ", "# # "],
        I: ["### ", " #  ", " #  ", " #  ", "### "],
        J: ["  # ", "  # ", "  # ", "# # ", " #  "],
        K: ["# # ", "##  ", "#   ", "##  ", "# # "],
        L: ["#   ", "#   ", "#   ", "#   ", "### "],
        M: ["# # ", "### ", "### ", "# # ", "# # "],
        N: ["# # ", "### ", "### ", "### ", "# # "],
        O: [" #  ", "# # ", "# # ", "# # ", " #  "],
        P: ["##  ", "# # ", "##  ", "#   ", "#   "],
        Q: [" ## ", "# # ", "# # ", " ## ", "  # "],
        R: ["##  ", "# # ", "##  ", "##  ", "# # "],
        S: [" ## ", "#   ", " #  ", "  # ", "##  "],
        T: ["### ", " #  ", " #  ", " #  ", " #  "],
        U: ["# # ", "# # ", "# # ", "# # ", "### "],
        V: ["# # ", "# # ", "# # ", "# # ", " #  "],
        W: ["# # ", "# # ", "### ", "### ", "# # "],
        X: ["# # ", "# # ", " #  ", "# # ", "# # "],
        Y: ["# # ", "# # ", " #  ", " #  ", " #  "],
        Z: ["### ", "  # ", " #  ", "#   ", "### "],
        " ": ["    ", "    ", "    ", "    ", "    "],
        "?": ["??? ", "??? ", "??? ", "??? ", "??? "]
    };

    const input = document.getElementById("textInput");
    const output = document.getElementById("asciiOutput");

    input.addEventListener("input", () => {
        const text = input.value.toUpperCase();
        const lines = ["", "", "", "", ""];

        for (let c of text) {
            const letter = asciiArt[c] || asciiArt["?"];
            for (let i = 0; i < 5; i++) {
                lines[i] += letter[i] + " ";
            }
        }

        output.value = lines.join("\n");
    });
</script>

</body>
</html>
