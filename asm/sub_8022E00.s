	.syntax unified
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_8022E00, "ax", %progbits
@ sub_8022E00 @ JP 0x08022E00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022E00
	.thumb_func
sub_8022E00:
	push {lr}
	ldr r0, _08022E18 @ =0x03004DF0
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl sub_8015E18
	pop {r0}
	bx r0
	.align 2, 0
_08022E18: .4byte 0x03004DF0

