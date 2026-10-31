module font_rom (
    input  wire [6:0] ascii,
    input  wire [2:0] row,      // 0..6
    output reg  [4:0] pixels    // 1 = pixel on
);

    always @(*) begin
        case (ascii)
            //Digits
            "0": case (row) 0: pixels=5'b01110; 1: pixels=5'b10001; 2: pixels=5'b10011; 3: pixels=5'b10101; 4: pixels=5'b11001; 5: pixels=5'b10001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "1": case (row) 0: pixels=5'b00100; 1: pixels=5'b01100; 2: pixels=5'b00100; 3: pixels=5'b00100; 4: pixels=5'b00100; 5: pixels=5'b00100; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "2": case (row) 0: pixels=5'b01110; 1: pixels=5'b10001; 2: pixels=5'b00001; 3: pixels=5'b00010; 4: pixels=5'b00100; 5: pixels=5'b01000; 6: pixels=5'b11111; default: pixels=5'b00000; endcase
            "3": case (row) 0: pixels=5'b11111; 1: pixels=5'b00010; 2: pixels=5'b00100; 3: pixels=5'b00010; 4: pixels=5'b00001; 5: pixels=5'b10001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "4": case (row) 0: pixels=5'b00010; 1: pixels=5'b00110; 2: pixels=5'b01010; 3: pixels=5'b10010; 4: pixels=5'b11111; 5: pixels=5'b00010; 6: pixels=5'b00010; default: pixels=5'b00000; endcase
            "5": case (row) 0: pixels=5'b11111; 1: pixels=5'b10000; 2: pixels=5'b11110; 3: pixels=5'b00001; 4: pixels=5'b00001; 5: pixels=5'b10001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "6": case (row) 0: pixels=5'b00110; 1: pixels=5'b01000; 2: pixels=5'b10000; 3: pixels=5'b11110; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "7": case (row) 0: pixels=5'b11111; 1: pixels=5'b00001; 2: pixels=5'b00010; 3: pixels=5'b00100; 4: pixels=5'b01000; 5: pixels=5'b01000; 6: pixels=5'b01000; default: pixels=5'b00000; endcase
            "8": case (row) 0: pixels=5'b01110; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b01110; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "9": case (row) 0: pixels=5'b01110; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b01111; 4: pixels=5'b00001; 5: pixels=5'b00010; 6: pixels=5'b01100; default: pixels=5'b00000; endcase

            //Uppercase
            "A": case (row) 0: pixels=5'b01110; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b11111; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b10001; default: pixels=5'b00000; endcase
            "B": case (row) 0: pixels=5'b11110; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b11110; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b11110; default: pixels=5'b00000; endcase
            "C": case (row) 0: pixels=5'b01111; 1: pixels=5'b10000; 2: pixels=5'b10000; 3: pixels=5'b10000; 4: pixels=5'b10000; 5: pixels=5'b10000; 6: pixels=5'b01111; default: pixels=5'b00000; endcase
            "D": case (row) 0: pixels=5'b11100; 1: pixels=5'b10010; 2: pixels=5'b10001; 3: pixels=5'b10001; 4: pixels=5'b10001; 5: pixels=5'b10010; 6: pixels=5'b11100; default: pixels=5'b00000; endcase
            "E": case (row) 0: pixels=5'b11111; 1: pixels=5'b10000; 2: pixels=5'b10000; 3: pixels=5'b11110; 4: pixels=5'b10000; 5: pixels=5'b10000; 6: pixels=5'b11111; default: pixels=5'b00000; endcase
            "F": case (row) 0: pixels=5'b11111; 1: pixels=5'b10000; 2: pixels=5'b10000; 3: pixels=5'b11110; 4: pixels=5'b10000; 5: pixels=5'b10000; 6: pixels=5'b10000; default: pixels=5'b00000; endcase
            "G": case (row) 0: pixels=5'b01111; 1: pixels=5'b10000; 2: pixels=5'b10000; 3: pixels=5'b10111; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b01111; default: pixels=5'b00000; endcase
            "H": case (row) 0: pixels=5'b10001; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b11111; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b10001; default: pixels=5'b00000; endcase
            "I": case (row) 0: pixels=5'b01110; 1: pixels=5'b00100; 2: pixels=5'b00100; 3: pixels=5'b00100; 4: pixels=5'b00100; 5: pixels=5'b00100; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "J": case (row) 0: pixels=5'b00001; 1: pixels=5'b00001; 2: pixels=5'b00001; 3: pixels=5'b00001; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "K": case (row) 0: pixels=5'b10001; 1: pixels=5'b10010; 2: pixels=5'b10100; 3: pixels=5'b11000; 4: pixels=5'b10100; 5: pixels=5'b10010; 6: pixels=5'b10001; default: pixels=5'b00000; endcase
            "L": case (row) 0: pixels=5'b10000; 1: pixels=5'b10000; 2: pixels=5'b10000; 3: pixels=5'b10000; 4: pixels=5'b10000; 5: pixels=5'b10000; 6: pixels=5'b11111; default: pixels=5'b00000; endcase
            "M": case (row) 0: pixels=5'b10001; 1: pixels=5'b11011; 2: pixels=5'b10101; 3: pixels=5'b10101; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b10001; default: pixels=5'b00000; endcase
            "N": case (row) 0: pixels=5'b10001; 1: pixels=5'b11001; 2: pixels=5'b10101; 3: pixels=5'b10011; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b10001; default: pixels=5'b00000; endcase
            "O": case (row) 0: pixels=5'b01110; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b10001; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "P": case (row) 0: pixels=5'b11110; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b11110; 4: pixels=5'b10000; 5: pixels=5'b10000; 6: pixels=5'b10000; default: pixels=5'b00000; endcase
            "Q": case (row) 0: pixels=5'b01110; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b10001; 4: pixels=5'b10101; 5: pixels=5'b10010; 6: pixels=5'b01101; default: pixels=5'b00000; endcase
            "R": case (row) 0: pixels=5'b11110; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b11110; 4: pixels=5'b10100; 5: pixels=5'b10010; 6: pixels=5'b10001; default: pixels=5'b00000; endcase
            "S": case (row) 0: pixels=5'b01111; 1: pixels=5'b10000; 2: pixels=5'b10000; 3: pixels=5'b01110; 4: pixels=5'b00001; 5: pixels=5'b00001; 6: pixels=5'b11110; default: pixels=5'b00000; endcase
            "T": case (row) 0: pixels=5'b11111; 1: pixels=5'b00100; 2: pixels=5'b00100; 3: pixels=5'b00100; 4: pixels=5'b00100; 5: pixels=5'b00100; 6: pixels=5'b00100; default: pixels=5'b00000; endcase
            "U": case (row) 0: pixels=5'b10001; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b10001; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "V": case (row) 0: pixels=5'b10001; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b10001; 4: pixels=5'b10001; 5: pixels=5'b01010; 6: pixels=5'b00100; default: pixels=5'b00000; endcase
            "W": case (row) 0: pixels=5'b10001; 1: pixels=5'b10001; 2: pixels=5'b10001; 3: pixels=5'b10101; 4: pixels=5'b10101; 5: pixels=5'b10101; 6: pixels=5'b01010; default: pixels=5'b00000; endcase
            "X": case (row) 0: pixels=5'b10001; 1: pixels=5'b10001; 2: pixels=5'b01010; 3: pixels=5'b00100; 4: pixels=5'b01010; 5: pixels=5'b10001; 6: pixels=5'b10001; default: pixels=5'b00000; endcase
            "Y": case (row) 0: pixels=5'b10001; 1: pixels=5'b10001; 2: pixels=5'b01010; 3: pixels=5'b00100; 4: pixels=5'b00100; 5: pixels=5'b00100; 6: pixels=5'b00100; default: pixels=5'b00000; endcase
            "Z": case (row) 0: pixels=5'b11111; 1: pixels=5'b00001; 2: pixels=5'b00010; 3: pixels=5'b00100; 4: pixels=5'b01000; 5: pixels=5'b10000; 6: pixels=5'b11111; default: pixels=5'b00000; endcase

            //Lowercase
            "a": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b01110; 3: pixels=5'b00001; 4: pixels=5'b01111; 5: pixels=5'b10001; 6: pixels=5'b01111; default: pixels=5'b00000; endcase
            "b": case (row) 0: pixels=5'b10000; 1: pixels=5'b10000; 2: pixels=5'b10110; 3: pixels=5'b11001; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b11110; default: pixels=5'b00000; endcase
            "c": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b01111; 3: pixels=5'b10000; 4: pixels=5'b10000; 5: pixels=5'b10001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "d": case (row) 0: pixels=5'b00001; 1: pixels=5'b00001; 2: pixels=5'b01101; 3: pixels=5'b10011; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b01111; default: pixels=5'b00000; endcase
            "e": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b01110; 3: pixels=5'b10001; 4: pixels=5'b11111; 5: pixels=5'b10000; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "f": case (row) 0: pixels=5'b00110; 1: pixels=5'b01001; 2: pixels=5'b01000; 3: pixels=5'b11110; 4: pixels=5'b01000; 5: pixels=5'b01000; 6: pixels=5'b01000; default: pixels=5'b00000; endcase
            "g": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b01111; 3: pixels=5'b10001; 4: pixels=5'b01111; 5: pixels=5'b00001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "h": case (row) 0: pixels=5'b10000; 1: pixels=5'b10000; 2: pixels=5'b10110; 3: pixels=5'b11001; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b10001; default: pixels=5'b00000; endcase
            "i": case (row) 0: pixels=5'b00100; 1: pixels=5'b00000; 2: pixels=5'b01100; 3: pixels=5'b00100; 4: pixels=5'b00100; 5: pixels=5'b00100; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "j": case (row) 0: pixels=5'b00010; 1: pixels=5'b00000; 2: pixels=5'b00110; 3: pixels=5'b00010; 4: pixels=5'b00010; 5: pixels=5'b10010; 6: pixels=5'b01100; default: pixels=5'b00000; endcase
            "k": case (row) 0: pixels=5'b10000; 1: pixels=5'b10000; 2: pixels=5'b10010; 3: pixels=5'b10100; 4: pixels=5'b11000; 5: pixels=5'b10100; 6: pixels=5'b10010; default: pixels=5'b00000; endcase
            "l": case (row) 0: pixels=5'b01100; 1: pixels=5'b00100; 2: pixels=5'b00100; 3: pixels=5'b00100; 4: pixels=5'b00100; 5: pixels=5'b00100; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "m": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b11010; 3: pixels=5'b10101; 4: pixels=5'b10101; 5: pixels=5'b10101; 6: pixels=5'b10101; default: pixels=5'b00000; endcase
            "n": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b10110; 3: pixels=5'b11001; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b10001; default: pixels=5'b00000; endcase
            "o": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b01110; 3: pixels=5'b10001; 4: pixels=5'b10001; 5: pixels=5'b10001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "p": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b11110; 3: pixels=5'b10001; 4: pixels=5'b11110; 5: pixels=5'b10000; 6: pixels=5'b10000; default: pixels=5'b00000; endcase
            "q": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b01111; 3: pixels=5'b10001; 4: pixels=5'b01111; 5: pixels=5'b00001; 6: pixels=5'b00001; default: pixels=5'b00000; endcase
            "r": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b10110; 3: pixels=5'b11001; 4: pixels=5'b10000; 5: pixels=5'b10000; 6: pixels=5'b10000; default: pixels=5'b00000; endcase
            "s": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b01111; 3: pixels=5'b10000; 4: pixels=5'b01110; 5: pixels=5'b00001; 6: pixels=5'b11110; default: pixels=5'b00000; endcase
            "t": case (row) 0: pixels=5'b01000; 1: pixels=5'b01000; 2: pixels=5'b11110; 3: pixels=5'b01000; 4: pixels=5'b01000; 5: pixels=5'b01001; 6: pixels=5'b00110; default: pixels=5'b00000; endcase
            "u": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b10001; 3: pixels=5'b10001; 4: pixels=5'b10001; 5: pixels=5'b10011; 6: pixels=5'b01101; default: pixels=5'b00000; endcase
            "v": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b10001; 3: pixels=5'b10001; 4: pixels=5'b10001; 5: pixels=5'b01010; 6: pixels=5'b00100; default: pixels=5'b00000; endcase
            "w": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b10001; 3: pixels=5'b10101; 4: pixels=5'b10101; 5: pixels=5'b10101; 6: pixels=5'b01010; default: pixels=5'b00000; endcase
            "x": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b10001; 3: pixels=5'b01010; 4: pixels=5'b00100; 5: pixels=5'b01010; 6: pixels=5'b10001; default: pixels=5'b00000; endcase
            "y": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b10001; 3: pixels=5'b10001; 4: pixels=5'b01111; 5: pixels=5'b00001; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "z": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b11111; 3: pixels=5'b00010; 4: pixels=5'b00100; 5: pixels=5'b01000; 6: pixels=5'b11111; default: pixels=5'b00000; endcase

			      // Unshifted punctuation
            "-": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b00000; 3: pixels=5'b11111; 4: pixels=5'b00000; 5: pixels=5'b00000; 6: pixels=5'b00000; default: pixels=5'b00000; endcase
            "=": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b11111; 3: pixels=5'b00000; 4: pixels=5'b11111; 5: pixels=5'b00000; 6: pixels=5'b00000; default: pixels=5'b00000; endcase
            ";": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b00100; 3: pixels=5'b00000; 4: pixels=5'b00000; 5: pixels=5'b00100; 6: pixels=5'b01000; default: pixels=5'b00000; endcase
            "'": case (row) 0: pixels=5'b00100; 1: pixels=5'b00100; 2: pixels=5'b01000; 3: pixels=5'b00000; 4: pixels=5'b00000; 5: pixels=5'b00000; 6: pixels=5'b00000; default: pixels=5'b00000; endcase
            ",": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b00000; 3: pixels=5'b00000; 4: pixels=5'b00000; 5: pixels=5'b00100; 6: pixels=5'b01000; default: pixels=5'b00000; endcase
            ".": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b00000; 3: pixels=5'b00000; 4: pixels=5'b00000; 5: pixels=5'b00000; 6: pixels=5'b00100; default: pixels=5'b00000; endcase
            "/": case (row) 0: pixels=5'b00001; 1: pixels=5'b00010; 2: pixels=5'b00010; 3: pixels=5'b00100; 4: pixels=5'b01000; 5: pixels=5'b01000; 6: pixels=5'b10000; default: pixels=5'b00000; endcase

            // Shifted symbols
            "!": case (row) 0: pixels=5'b00100; 1: pixels=5'b00100; 2: pixels=5'b00100; 3: pixels=5'b00100; 4: pixels=5'b00100; 5: pixels=5'b00000; 6: pixels=5'b00100; default: pixels=5'b00000; endcase
            "@": case (row) 0: pixels=5'b01110; 1: pixels=5'b10001; 2: pixels=5'b10111; 3: pixels=5'b10101; 4: pixels=5'b10111; 5: pixels=5'b10000; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "#": case (row) 0: pixels=5'b01010; 1: pixels=5'b01010; 2: pixels=5'b11111; 3: pixels=5'b01010; 4: pixels=5'b11111; 5: pixels=5'b01010; 6: pixels=5'b01010; default: pixels=5'b00000; endcase
            "$": case (row) 0: pixels=5'b00100; 1: pixels=5'b01111; 2: pixels=5'b10100; 3: pixels=5'b01110; 4: pixels=5'b00101; 5: pixels=5'b11110; 6: pixels=5'b00100; default: pixels=5'b00000; endcase
            "%": case (row) 0: pixels=5'b11001; 1: pixels=5'b11001; 2: pixels=5'b00010; 3: pixels=5'b00100; 4: pixels=5'b01000; 5: pixels=5'b10011; 6: pixels=5'b10011; default: pixels=5'b00000; endcase
            "^": case (row) 0: pixels=5'b00100; 1: pixels=5'b01010; 2: pixels=5'b10001; 3: pixels=5'b00000; 4: pixels=5'b00000; 5: pixels=5'b00000; 6: pixels=5'b00000; default: pixels=5'b00000; endcase
            "&": case (row) 0: pixels=5'b01100; 1: pixels=5'b10010; 2: pixels=5'b10100; 3: pixels=5'b01000; 4: pixels=5'b10101; 5: pixels=5'b10010; 6: pixels=5'b01101; default: pixels=5'b00000; endcase
            "*": case (row) 0: pixels=5'b00000; 1: pixels=5'b00100; 2: pixels=5'b10101; 3: pixels=5'b01110; 4: pixels=5'b10101; 5: pixels=5'b00100; 6: pixels=5'b00000; default: pixels=5'b00000; endcase
            "(": case (row) 0: pixels=5'b00010; 1: pixels=5'b00100; 2: pixels=5'b01000; 3: pixels=5'b01000; 4: pixels=5'b01000; 5: pixels=5'b00100; 6: pixels=5'b00010; default: pixels=5'b00000; endcase
            ")": case (row) 0: pixels=5'b01000; 1: pixels=5'b00100; 2: pixels=5'b00010; 3: pixels=5'b00010; 4: pixels=5'b00010; 5: pixels=5'b00100; 6: pixels=5'b01000; default: pixels=5'b00000; endcase
            "_": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b00000; 3: pixels=5'b00000; 4: pixels=5'b00000; 5: pixels=5'b00000; 6: pixels=5'b11111; default: pixels=5'b00000; endcase
            "+": case (row) 0: pixels=5'b00000; 1: pixels=5'b00100; 2: pixels=5'b00100; 3: pixels=5'b11111; 4: pixels=5'b00100; 5: pixels=5'b00100; 6: pixels=5'b00000; default: pixels=5'b00000; endcase
            ":": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b00100; 3: pixels=5'b00000; 4: pixels=5'b00000; 5: pixels=5'b00100; 6: pixels=5'b00000; default: pixels=5'b00000; endcase
            "\"": case (row) 0: pixels=5'b01010; 1: pixels=5'b01010; 2: pixels=5'b01010; 3: pixels=5'b00000; 4: pixels=5'b00000; 5: pixels=5'b00000; 6: pixels=5'b00000; default: pixels=5'b00000; endcase
            "<": case (row) 0: pixels=5'b00010; 1: pixels=5'b00100; 2: pixels=5'b01000; 3: pixels=5'b10000; 4: pixels=5'b01000; 5: pixels=5'b00100; 6: pixels=5'b00010; default: pixels=5'b00000; endcase
            ">": case (row) 0: pixels=5'b01000; 1: pixels=5'b00100; 2: pixels=5'b00010; 3: pixels=5'b00001; 4: pixels=5'b00010; 5: pixels=5'b00100; 6: pixels=5'b01000; default: pixels=5'b00000; endcase
            "?": case (row) 0: pixels=5'b01110; 1: pixels=5'b10001; 2: pixels=5'b00001; 3: pixels=5'b00010; 4: pixels=5'b00100; 5: pixels=5'b00000; 6: pixels=5'b00100; default: pixels=5'b00000; endcase
			      "`": case (row) 0: pixels=5'b01000; 1: pixels=5'b00100; 2: pixels=5'b00010; 3: pixels=5'b00000; 4: pixels=5'b00000; 5: pixels=5'b00000; 6: pixels=5'b00000; default: pixels=5'b00000; endcase
            "~": case (row) 0: pixels=5'b00000; 1: pixels=5'b00000; 2: pixels=5'b01000; 3: pixels=5'b10101; 4: pixels=5'b00010; 5: pixels=5'b00000; 6: pixels=5'b00000; default: pixels=5'b00000; endcase
            "[": case (row) 0: pixels=5'b01110; 1: pixels=5'b01000; 2: pixels=5'b01000; 3: pixels=5'b01000; 4: pixels=5'b01000; 5: pixels=5'b01000; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "]": case (row) 0: pixels=5'b01110; 1: pixels=5'b00010; 2: pixels=5'b00010; 3: pixels=5'b00010; 4: pixels=5'b00010; 5: pixels=5'b00010; 6: pixels=5'b01110; default: pixels=5'b00000; endcase
            "{": case (row) 0: pixels=5'b00110; 1: pixels=5'b01000; 2: pixels=5'b01000; 3: pixels=5'b10000; 4: pixels=5'b01000; 5: pixels=5'b01000; 6: pixels=5'b00110; default: pixels=5'b00000; endcase
            "}": case (row) 0: pixels=5'b01100; 1: pixels=5'b00010; 2: pixels=5'b00010; 3: pixels=5'b00001; 4: pixels=5'b00010; 5: pixels=5'b00010; 6: pixels=5'b01100; default: pixels=5'b00000; endcase
	
            " ": pixels = 5'b00000;
            default: pixels = 5'b00000;
        endcase
    end

endmodule
