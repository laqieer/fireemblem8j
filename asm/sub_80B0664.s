	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80B0664, "ax", %progbits
@ sub_80B0664 @ JP 0x080B0664 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0664
	.thumb_func
sub_80B0664:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080B0694 @ =0x08A9D668
	adds r1, r3, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x2a
	movs r1, #0
	strb r4, [r0]
	adds r0, #1
	strb r5, [r0]
	subs r0, #2
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0694: .4byte 0x08A9D668

