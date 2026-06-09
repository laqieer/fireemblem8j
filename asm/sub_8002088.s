	.syntax unified
	.set j_ClearOam, 0x080DC0D4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8002088, "ax", %progbits
@ sub_8002088 @ JP 0x08002088 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002088
	.thumb_func
sub_8002088:
	push {r4, lr}
	ldr r4, _080020B8 @ =0x03000018
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	lsls r2, r2, #1
	bl sub_80D636C
	ldr r0, [r4]
	ldrh r1, [r4, #0xa]
	bl j_ClearOam
	ldr r1, _080020BC @ =0x030036E4
	ldr r0, [r4]
	str r0, [r1]
	ldr r1, _080020C0 @ =0x030040F8
	ldr r0, _080020C4 @ =0x030030E0
	str r0, [r1]
	ldr r1, _080020C8 @ =0x030030CC
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080020B8: .4byte 0x03000018
_080020BC: .4byte 0x030036E4
_080020C0: .4byte 0x030040F8
_080020C4: .4byte 0x030030E0
_080020C8: .4byte 0x030030CC

