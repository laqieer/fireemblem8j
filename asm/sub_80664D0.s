	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80664D0, "ax", %progbits
@ sub_80664D0 @ JP 0x080664D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80664D0
	.thumb_func
sub_80664D0:
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _080664E8 @ =0x08763A5C
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0
_080664E8: .4byte 0x08763A5C

