module PolicyOcr
  class GlyphDecoder
    TO_NUMERIC = {
      " _ " +
      "| |" +
      "|_|" => "0",
      "   " +
      "  |" +
      "  |" => "1",
      " _ " +
      " _|" +
      "|_ " => "2",
      " _ " +
      " _|" +
      " _|" => "3",
      "   " +
      "|_|" +
      "  |" => "4",
      " _ " +
      "|_ " +
      " _|" => "5",
      " _ " +
      "|_ " +
      "|_|" => "6",
      " _ " +
      "  |" +
      "  |" => "7",
      " _ " +
      "|_|" +
      "|_|" => "8",
      " _ " +
      "|_|" +
      " _|" => "9"
    }

    def self.decode_lines(lines)
      lines_to_glyphs(lines).map { |glyph| glyph_to_numeral(glyph) }
    end

    private

    def lines_to_glyphs(lines)
      tops, middles, bottoms, _split = lines.map { |line| line.scan(/.../) }
      glyphs = tops.zip(middles, bottoms).map { |row| row.join }
      glyphs.map { |glyph| glyph_to_numeral(glyph) }
    end

    def glyph_to_numeral(line)
      TO_NUMERIC[line]
    end
  end
end