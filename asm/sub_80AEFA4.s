	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80AEFA4, "ax", %progbits
@ sub_80AEFA4 @ JP 0x080AEFA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEFA4
	.thumb_func
sub_80AEFA4:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AEFD4 @ =0x08A9CFE4
	bl Proc_StartBlocking
	adds r3, r0, #0
	adds r3, #0x42
	movs r2, #0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3]
	adds r0, #0x35
	strb r2, [r0]
	ldr r2, _080AEFD8 @ =0x0202BCEC
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080AEFD4: .4byte 0x08A9CFE4
_080AEFD8: .4byte 0x0202BCEC

