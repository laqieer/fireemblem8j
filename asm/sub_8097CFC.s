	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set StartMuralBackground, 0x08088E74 + 1
	.section .text.sub_8097CFC, "ax", %progbits
@ sub_8097CFC @ JP 0x08097CFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097CFC
	.thumb_func
sub_8097CFC:
	push {lr}
	ldr r0, _08097D14 @ =0x08A7279C
	bl Proc_EndEach
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackground
	pop {r0}
	bx r0
	.align 2, 0
_08097D14: .4byte 0x08A7279C

