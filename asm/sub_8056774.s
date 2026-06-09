	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8056774, "ax", %progbits
@ sub_8056774 @ JP 0x08056774 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056774
	.thumb_func
sub_8056774:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _08056794 @ =0x06010800
	ldr r4, _08056798 @ =0x0201A790
	adds r1, r4, #0
	bl sub_80D6394
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056794: .4byte 0x06010800
_08056798: .4byte 0x0201A790

