	.syntax unified
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8071104, "ax", %progbits
@ sub_8071104 @ JP 0x08071104 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071104
	.thumb_func
sub_8071104:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8070F08
	ldr r1, _08071124 @ =0x08603B58
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_80D65C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071124: .4byte 0x08603B58

