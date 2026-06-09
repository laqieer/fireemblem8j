	.syntax unified
	.set sub_8001EF0, 0x08001EF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8073820, 0x08073820 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8079F80, "ax", %progbits
@ sub_8079F80 @ JP 0x08079F80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079F80
	.thumb_func
sub_8079F80:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08079FD0 @ =0x020228A8
	ldr r4, _08079FD4 @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80D636C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl sub_8073820
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_80D636C
	bl sub_8001EF0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _08079FCA
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl sub_8002DE4
_08079FCA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079FD0: .4byte 0x020228A8
_08079FD4: .4byte 0x020165C8

