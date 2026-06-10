	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8020AE0, "ax", %progbits
@ sub_8020AE0 @ JP 0x08020AE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020AE0
	.thumb_func
sub_8020AE0:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x78
	bl sub_8012E84
	ldr r3, _08020B3C @ =0x03003020
	movs r1, #0x78
	subs r1, r1, r0
	movs r2, #0x2d
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r6, ip
	strb r1, [r6]
	adds r1, r3, #0
	adds r1, #0x31
	strb r2, [r1]
	adds r0, #0x78
	subs r1, #5
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _08020B34
	adds r0, r5, #0
	bl sub_8002DE4
_08020B34:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020B3C: .4byte 0x03003020

