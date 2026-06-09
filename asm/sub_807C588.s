	.syntax unified
	.set IsMuActive, 0x0807AB94 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_807BFF4, 0x0807BFF4 + 1
	.section .text.sub_807C588, "ax", %progbits
@ sub_807C588 @ JP 0x0807C588 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807C588
	.thumb_func
sub_807C588:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x30]
	bl sub_807BFF4
	adds r0, r5, #0
	bl IsMuActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807C5E6
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	strb r0, [r1, #0x10]
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	strb r0, [r1, #0x11]
	ldrh r0, [r4, #0x3a]
	adds r0, #1
	strh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x38]
	cmp r0, r1
	bhs _0807C5DA
	adds r0, r5, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807C5DA
	ldrh r0, [r4, #0x3a]
	ldr r1, [r4, #0x34]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	strh r0, [r4, #0x3c]
	movs r0, #0
	b _0807C5E8
_0807C5DA:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _0807C5E8
_0807C5E6:
	movs r0, #1
_0807C5E8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

