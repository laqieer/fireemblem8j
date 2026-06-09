	.syntax unified
	.set ArchiveCurrentPalettes, 0x0801358C + 1
	.set sub_8013608, 0x08013608 + 1
	.section .text.sub_80333DC, "ax", %progbits
@ sub_80333DC @ JP 0x080333DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80333DC
	.thumb_func
sub_80333DC:
	push {lr}
	bl ArchiveCurrentPalettes
	ldr r3, _080333F4 @ =0xFF00FFF0
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_8013608
	pop {r0}
	bx r0
	.align 2, 0
_080333F4: .4byte 0xFF00FFF0

