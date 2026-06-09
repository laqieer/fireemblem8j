	.syntax unified
	.section .text.SioQueuePendingRecvData, "ax", %progbits
@ SioQueuePendingRecvData @ JP 0x080425A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioQueuePendingRecvData
	.thumb_func
SioQueuePendingRecvData:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r3, _0804260C @ =0x085D31E8
	ldr r2, [r3]
	ldr r1, _08042610 @ =0x00001B77
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	ldr r1, _08042614 @ =0x000012B4
	adds r0, r0, r1
	adds r1, r2, r0
	ldrb r0, [r4]
	strb r0, [r1, #4]
	ldrb r0, [r4, #1]
	strb r0, [r1, #5]
	ldrh r0, [r4, #2]
	strh r0, [r1, #6]
	ldrh r0, [r4, #4]
	strh r0, [r1, #8]
	movs r2, #0
	adds r6, r3, #0
	ldrh r0, [r4, #4]
	cmp r2, r0
	bge _080425EC
	adds r5, r1, #0
	adds r5, #0xa
	adds r3, r4, #6
_080425DC:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	ldrh r1, [r4, #4]
	cmp r2, r1
	blt _080425DC
_080425EC:
	ldr r1, [r6]
	ldr r2, _08042610 @ =0x00001B77
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804260C: .4byte 0x085D31E8
_08042610: .4byte 0x00001B77
_08042614: .4byte 0x000012B4

