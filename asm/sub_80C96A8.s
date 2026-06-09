	.syntax unified
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_80C96A8, "ax", %progbits
@ sub_80C96A8 @ JP 0x080C96A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C96A8
	.thumb_func
sub_80C96A8:
	push {r4, lr}
	bl sub_8001BC0
	adds r2, r0, #0
	movs r4, #0xf0
	lsls r4, r4, #8
	movs r1, #0
	ldr r3, _080C96CC @ =0x0000027F
_080C96B8:
	adds r0, r4, r1
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, r3
	ble _080C96B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C96CC: .4byte 0x0000027F

