	.syntax unified
	.set sub_8001EF0, 0x08001EF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_806E478, "ax", %progbits
@ sub_806E478 @ JP 0x0806E478 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E478
	.thumb_func
sub_806E478:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, _0806E4C8 @ =0x020165C8
	movs r1, #0
	adds r6, r2, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldr r3, _0806E4CC @ =0x00007FFF
	adds r0, r3, #0
_0806E48A:
	adds r2, #2
	adds r3, r1, #1
	movs r1, #0xe
_0806E490:
	strh r0, [r2]
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0806E490
	adds r1, r3, #0
	cmp r1, #0x1f
	ble _0806E48A
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	bl sub_80D636C
	bl sub_8001EF0
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bne _0806E4D0
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl sub_8002DE4
	b _0806E4D4
	.align 2, 0
_0806E4C8: .4byte 0x020165C8
_0806E4CC: .4byte 0x00007FFF
_0806E4D0:
	adds r0, r1, #1
	strh r0, [r4]
_0806E4D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

