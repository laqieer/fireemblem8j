	.syntax unified
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_807CCF8, "ax", %progbits
@ sub_807CCF8 @ JP 0x0807CCF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CCF8
	.thumb_func
sub_807CCF8:
	push {lr}
	ldr r1, _0807CD10 @ =0x0203E1EC
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_8015E18
	pop {r0}
	bx r0
	.align 2, 0
_0807CD10: .4byte 0x0203E1EC

