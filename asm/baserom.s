@ Raw-ROM decompilation baseline.
@
@ The original ROM is incbinned in chunks; decompiled objects are spliced into
@ the gaps by ldscript.txt at their exact JP addresses, so the build stays
@ byte-perfect (`make compare` -> OK) while progress accrues. As more code/data
@ is decompiled, these chunks are subdivided further.
@
@ Carved so far:
@   0x000000..0x0000BF  ROM header        -> asm/rom_header.s
@   0x000B60..0x000CD8  src/rng.o(.text)  (NextRN .. AdvanceGetLCGRNValue)
@   0x0DC134..0x0DC144  src/rng.o(.rodata)(InitRN seed table)

	.section .rom_0, "ax", %progbits
	.incbin "baserom.gba", 0xC0, 0xAA0       @ 0x0000C0 .. 0x000B60

	.section .rom_1, "ax", %progbits
	.incbin "baserom.gba", 0xCD8, 0xDB45C     @ 0x000CD8 .. 0x0DC134

	.section .rom_2, "ax", %progbits
	.incbin "baserom.gba", 0xDC144            @ 0x0DC144 .. EOF
